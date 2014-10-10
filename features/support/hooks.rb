After('@clean_up_needed') do
	lorem_ipsum_post_title = 'Lorem Ipsum'
	steps_helper = StepsDefinition::StepsHelper.new

	return unless page.has_content?(lorem_ipsum_post_title)

	divs = steps_helper.post_divs_matching_title(page, lorem_ipsum_post_title)
	expect(divs.length).to be >= 1

	divs.each do |div|
		within(div) do
			find('.remove_post_button').click
		end
	end
end

After('@logout_needed') do
	return unless page.has_link?('log_out_link')
	logout_link = page.find_link 'log_out_link'
	logout_link.click
end