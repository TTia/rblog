steps_helper = StepsDefinition::StepsHelper.new

When(/^navigo verso la home page$/) do
	find_link(steps_helper.home_page_name).click
end

When(/^navigo verso "([^"]*)"$/) do |page_name|
	find_link(page_name).click
end

When(/^il cursore si sposta sui collegamenti$/) do
	@textual_header_link_divs.each do |banner_link_div|
		id = banner_link_div[:id]
		@header.find_by_id(id).hover
		@color = steps_helper.background_color("##{id}", page)
	end
end

When(/^inserisco "([^"]*)" come titolo$/) do |title_value|
	page.fill_in 'post_title', :with => title_value
end

When(/^inserisco "([^"]*)" come contenuto$/) do |content|
	page.fill_in 'post_body', :with => content
end

When(/^inserisco del testo riempitivo come contenuto$/) do
	lorem_ipsum_content = 'Lorem ipsum dolor sit amet,
consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
nascetur ridiculus mus. Donec quam felis, ultricies nec,
pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.
Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.
In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.
Nullam dictum felis eu pede mollis pretium. Integer tincidunt.
Cras dapibus. Vivamus elementum semper nisi.
Aenean vulputate eleifend tellus.
Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.'
	step "inserisco \"#{lorem_ipsum_content}\" come contenuto"
end

When(/^salvo il post$/) do
	click_button 'submit'
end

When(/^cancello il post "([^"]*)"$/) do |post_title|
	expect(page.has_content?(post_title)).to be_truthy

	post_div = steps_helper.post_div_by_title(page, post_title)
	within(post_div) do
		find('.remove_post_button').click
	end
end

When(/^modifico il post "([^"]*)"$/) do |post_title|
	expect(page.has_content?(post_title)).to be_truthy

	post_div = steps_helper.post_div_by_title(page, post_title)
	within(post_div) do
		find('.edit_post_button').click
	end
end

When(/^espando il post "([^"]*)"$/) do |post_title|
	post_div = steps_helper.post_div_by_title(page, post_title)

	post_div.find('.read_more_link').click
end

When(/^mi autentico come "([^"]*)"$/) do |email|
	pre_login_encrypted_session = steps_helper.encrypted_session(page)

	visit steps_helper.login_page_url

	page.fill_in 'email', :with => email
	page.fill_in 'hpassword', :with => 'password'

	page.find('#login_button').click
	post_login_encrypted_session = steps_helper.encrypted_session(page)
	expect(pre_login_encrypted_session).not_to eq(post_login_encrypted_session)
end

When(/^quando mi disconnetto$/) do
	logout_link = page.find_link 'log_out_link'
	logout_link.click
end

When(/^clicco sull'area del pié di pagina$/) do
	step 'è presente il pié di pagina'
	@footer.click
end

When(/^inserisco il testo "([^"]*)" da ricercare$/) do |searched_text|
	page.fill_in 'search', :with => searched_text
	search_input = page.find('#search_input_text')
	search_input.trigger(:focus)
	#search_input.trigger(:keydown)
	page.execute_script %Q{ $('#search_input_text').trigger('keydown') }
	steps_helper.wait_for_ajax page
end

When(/^ricerco "([^"]*)"$/) do |searched_text|
	step "inserisco il testo \"#{searched_text}\" da ricercare"
	steps_helper.wait_for_ajax page do
		regexp = Regexp.new(Regexp.escape(searched_text), 'i')
		if page.has_css?('.ui-menu-item', :text => regexp)

			post_hint = page.find(:xpath, "//li[@class = 'ui-menu-item']")
			expect(post_hint.text).to match(%r{#{searched_text}}i)

			post_hint.trigger(:mouseenter)
			post_hint.click
		end

		find('#search_icon').click
	end
end