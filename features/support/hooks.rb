=begin
Before('@login') do
	if page.has_link?('#log_out_link')
		steps_helper = StepsDefinition::StepsHelper.new
		steps_helper.logout page
	end
end
=end

After('@clear') do
	clear_all_ipsums(page)
end

After('@logout') do
	logout(page)
end

After('@clear_and_logout') do
	clear_all_ipsums(page)
	logout(page)
end

def clear_all_ipsums(page)
	lorem_ipsum_post_title = 'Lorem Ipsum'
	steps_helper = StepsDefinition::StepsHelper.new
	visit steps_helper.rblog_url

	return unless page.has_content?(lorem_ipsum_post_title)

	divs = steps_helper.post_divs_matching_title(page, lorem_ipsum_post_title)
	expect(divs.length).to be >= 1

	divs.each do |div|
		within(div) do
			find('.remove_post_button').click
		end
	end
end

def logout(page)
	steps_helper = StepsDefinition::StepsHelper.new
	steps_helper.logout page
end