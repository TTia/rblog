steps_helper = StepsDefinition::StepsHelper.new

When(/^navigo verso la home page$/) do
	find_link(steps_helper.home_page_name).click
end

When(/^navigo verso "([^"]*)"$/) do |page_link|
	find_link(page_link).click
end

When(/^il cursore si sposta sui collegamenti$/) do
	@banner_link_divs.each do |banner_link_div|
		id = banner_link_div[:id]
		@header.find_by_id(id).hover
		@color = steps_helper.background_color("##{id}", page)
	end
end