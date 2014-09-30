steps_helper = StepsDefinition::StepsHelper.new

Given(/^apro RBlog$/) do
	visit steps_helper.rblog_url
	page.status_code == 200
end

Given(/^è presente l'intestazione$/) do
	@header = page.find(steps_helper.header_id)
	expect(@header).not_to be_nil
end

Given(/^è presente il pié di pagina$/) do
	@footer = page.find(steps_helper.footer_id)
	expect(@footer).not_to be_nil
end

Given(/^l'intestazione ha un colore di sfondo$/) do
	@header_background = steps_helper.background_color(steps_helper.header_id, page)
end

Given(/^il pié di pagina ha un colore di sfondo$/) do
	@footer_background = steps_helper.background_color(steps_helper.footer_id, page)
end

Given(/^l'intestazione permette la navigazione$/) do
	@links = @header.all('a')
	expect(@links.length).to eq(4)

	@textual_header_link_divs = @header.all('.banner_link')
	expect(@textual_header_link_divs.length).to eq(steps_helper.textual_header_links.length)
=begin
	#riscritto
	@banner_link_divs = @header.all('.banner_link')
	@banner_link_divs.length.should eq(steps_helper.header_links.length)

	@links = []
	@banner_link_divs.each do |banner_link_div|
		@links << banner_link_div.find('a')
	end
=end

end

Given(/^la pagina ha un titolo$/) do
	@page_title = page.title
end

Given(/^i collegamenti non hanno sfondo$/) do
	# todo
	#header_rgb_background = steps_helper.background_color(steps_helper.header_id, page)

	@textual_header_link_divs.each do |banner_link_div|
		id = banner_link_div[:id]
		background_color = steps_helper.background_color("##{id}", page)
		expect(background_color).to eq('rgba(0, 0, 0, 0)')
		# todo
		#steps_helper.background_color("##{id}", page).should eq(header_rgb_background)
	end
end

Given(/^sono presenti dei collegamenti raffigurati tramite immagini$/) do
	linked_pictures = steps_helper.linked_pictures page
	expect(linked_pictures.length).not_to eq(0)
end

Given(/^apro la pagina per la creazione di un nuovo post$/) do
	page.first('.new_post_link').click
end

Given(/^il post "([^"]*)" non è leggibile su RBlog$/) do |post_title|
	expect do
		steps_helper.post_div_by_title(page, post_title)
	end.to raise_error Capybara::ElementNotFound
end

Given(/^il post "([^"]*)" esiste$/) do |post_title|
	step 'apro la pagina per la creazione di un nuovo post'
	step "inserisco \"#{post_title}\" come titolo"
	step 'inserisco del testo riempitivo come contenuto'
	step 'salvo il post'
	step "il post \"#{post_title}\" è stato creato con successo"
	step "il post \"#{post_title}\" è leggibile su RBlog"
	step 'apro RBlog'
end