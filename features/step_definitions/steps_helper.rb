module StepsDefinition
	class StepsHelper

		def rblog_url
			'http://localhost:3000'
		end

		def home_page_name
			'RBlog'
		end

		def abstract_page_name
			'Abstract'
		end

		def author_page_name
			'Autore'
		end

		def header_id
			'#header'
		end

		def footer_id
			'#footer'
		end

		def background_color(id, page)
			jscript = "$('#{id}').css('backgroundColor')"
			page.evaluate_script(jscript)
		end

		def textual_header_links
			[:author, :abstract]
		end

		def linked_pictures(page)
			page.all(:xpath, '//a[@href]/img')
		end

		def take_screenshot(page)
			page.save_screenshot('screenshot.png')
		end

		def post_div_by_title(page, post_title)
			xpath_query = "//div[@class = 'post'][p/a[text() = '#{post_title}']]"
			page.find(:xpath, xpath_query)
		end

		def post_divs_matching_title(page, post_title)
			xpath_query = "//div[@class = 'post'][p/a[contains(text(),'#{post_title}')]]"
			page.all(:xpath, xpath_query)
		end

	end
end