module ApplicationHelper
	def new_post_image_link(border = 0, size = '48x48', alt = 'Nuovo post')
		image_tag = image_tag('add.png', :border => border, size: size, :title => alt)
		link_to image_tag, new_post_path, class: 'new_post_link'
	end

	def edit_post_image_link(post, border = 0, size = '32x32',
	                         alt = "Aggiorna '#{post.title}'")
		image_tag = image_tag('write.png', :border => border, size: size, :title => alt)
		link_to image_tag, edit_post_path(post), class: 'edit_post_button'
	end

	def remove_post_image_link(post, border = 0, size = '32x32',
	                           alt = "Rimuovi '#{post.title}'")
		image_tag = image_tag('remove.png', :border => border, size: size, :title => alt)
		remove_message = "Sei sicuro di voler cancellare '#{post.title}'?"
		link_to image_tag, post,
		        method: :delete, data: {confirm: remove_message},
		        class: 'remove_post_button'
	end

	def logo_image_link(size = '96x96', border = 0, alt = 'RBlog')
		image_tag = image_tag('rails.png', :border => border, size: size, :title => alt)
		link_to image_tag, :root
	end

	def bulb_image_tag(border = 0, size = '32x32',
	                   alt = 'Operazione completata')
		image_tag('bulb.png', :border => border, size: size, :title => alt)
	end
end
