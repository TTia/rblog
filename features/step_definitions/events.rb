steps_helper = StepsDefinition::StepsHelper.new

When(/^navigo verso la home page$/) do
	find_link(steps_helper.home_page_name).click
end

When(/^navigo verso "([^"]*)"$/) do |page_link|
	find_link(page_link).click
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

And(/^inserisco "([^"]*)" come contenuto$/) do |content|
	page.fill_in 'post_body', :with => content
end

When(/^inserisco del testo riempitivo come contenuto$/) do
	lorem_ipsum_content = 'Lorem ipsum dolor sit amet,
consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
nascetur ridiculus mus. Donec quam felis, ultricies nec,
pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. '
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