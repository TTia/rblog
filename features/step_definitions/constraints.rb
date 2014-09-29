steps_helper = StepsDefinition::StepsHelper.new

Given(/^apro RBlog$/) do
	visit steps_helper.rblog_url
	page.status_code == 200
end

Given(/^è presente l'intestazione$/) do
	@header = page.find(steps_helper.header_id)
	@header.should_not nil?
end

Given(/^è presente il pié di pagina$/) do
	@footer = page.find(steps_helper.footer_id)
	@footer.should_not nil?
end

Given(/^l'intestazione ha un colore di sfondo$/) do
	@header_background = steps_helper.background_color(steps_helper.header_id, page)
end

Given(/^il pié di pagina ha un colore di sfondo$/) do
	@footer_background = steps_helper.background_color(steps_helper.footer_id, page)
end

Given(/^l'intestazione permette la navigazione$/) do
	@banner_link_divs = @header.all('.banner_link')
	@banner_link_divs.length.should eq(3)

	@links = []
	@banner_link_divs.each do |banner_link_div|
		@links << banner_link_div.find('a')
	end
end

Given(/^l'intestazione contiene il titolo della pagina$/) do
	@page_title = @header.find('h1').text;
end

Given(/^i collegamenti non hanno sfondo$/) do
	# todo
	#header_rgb_background = steps_helper.background_color(steps_helper.header_id, page)

	@banner_link_divs.each do |banner_link_div|
		id = banner_link_div[:id]
		steps_helper.background_color("##{id}", page).should eq('rgba(0, 0, 0, 0)')
		# todo
		#steps_helper.background_color("##{id}", page).should eq(header_rgb_background)
	end
end