After('@clean_up_needed') do
	lorem_ipsum_post_title = 'Lorem Ipsum'
	steps_helper = StepsDefinition::StepsHelper.new

	return unless page.has_content?(lorem_ipsum_post_title)

	lorem_ipsum_div = steps_helper.post_div_by_title(page, lorem_ipsum_post_title)
	within(lorem_ipsum_div) do
		find('.remove_post_button').click
	end
end