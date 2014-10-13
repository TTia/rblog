require_relative 'steps_helper.rb'
steps_helper = StepsDefinition::StepsHelper.new

Then(/^la pagina è intitolata "([^"]*)"$/) do |title_value|
	page.has_title? title_value
end

Then(/^posso tornare alla pagina iniziale$/) do
	find_link('RBlog').visible?
end

Then(/^posso visitare la pagina dell'autore$/) do
	find_link('Autore').visible?
end

Then(/^posso visitare la pagina dell'abstract$/) do
	find_link('Abstract').visible?
end

Then(/^l'intestazione è posizionata all'inizio$/) do
	header = page.find(:xpath, 'descendant::body/*[1]')
	expect(@header).to eq(header)
end

Then(/^il piè di pagina è posizionato alla fine$/) do
	footer = page.find(:xpath, 'descendant::body/div[last()]')
	expect(@footer).to be == footer
end

Then(/^intestazione e pié di pagina hanno lo stesso colore di sfondo$/) do
	expect(@header_background).to eq(@footer_background)
end

Then(/^posso navigare verso "([^"]*)"$/) do |page_name|
	link_names = @links.map { |link| link.text }
	expect(link_names).to include(page_name)
end

Then(/^il titolo della pagina è uguale a "([^"]*)"$/) do |page_name|
	expect(page_name).to eq(@page_title)
end

Then(/^lo sfondo del collegamento cambia$/) do
	expect(@pre_color).not_to eq(@color)
end

Then(/^ogni collegamento ha una descrizione testuale$/) do
	steps_helper.linked_pictures(page).each do |linked_picture|
		alt_value = linked_picture[:alt].lstrip
		expect(alt_value).not_to be_nil
		expect(alt_value).not_to eq('')
	end
end

Then(/^il post "([^"]*)" è leggibile$/) do |post_title|
	expect do
		post_div = steps_helper.post_div_by_title page, post_title
		expect(post_div).not_to be_nil
	end.not_to raise_error
end

Then(/^il post "([^"]*)" è leggibile su RBlog$/) do |post_title|
	step 'apro RBlog'
	step "il post \"#{post_title}\" è leggibile"
end

Then(/^il post "([^"]*)" è stato (?:creato|modificato|cancellato) con successo$/) do |post_title|
	steps_helper.take_screenshot page
	expect(page.has_css?('#notice')).to be_truthy
	expect(page.has_content?(post_title)).to be_truthy
end

Then(/^compare l'errore "([^"]*)"$/) do |error_message|
	expect(page.has_css?('.error_explanation')).to be_truthy
	expect(page.has_content?(error_message)).to be_truthy
end

Then(/^ogni post ha un titolo$/) do
	steps_helper.post_divs(page).each do |post_div|
		post_div.has_css?('.post_title')
	end
end

Then(/^ogni post ha del contenuto$/) do
	steps_helper.post_divs(page).each do |post_div|
		post_div.has_css?('.post_content')
	end
end

And(/^ogni post ha dei dettagli$/) do
	steps_helper.post_divs(page).each do |post_div|
		post_div.has_css?('.post_detail')
	end
end

Then(/^il post "([^"]*)" non è leggibile$/) do |post_title|
	expect do
		steps_helper.post_div_by_title(page, post_title)
	end.to raise_error Capybara::ElementNotFound
end

Then(/^il contenuto del post "([^"]*)" è un'anteprima dell'intero post$/) do |post_title|
	post_div = steps_helper.post_div_by_title(page, post_title)
	content = post_div.find('.post_content').text
	expect(content.length).to be <= 505

	expect(post_div.has_css?('.read_more_link')).to be_truthy
end


Then(/^il contenuto del post "([^"]*)" rappresenta l'intero post$/) do |post_title|
	post_div = steps_helper.post_div_by_title(page, post_title)
	content = post_div.find('.post_content').text
	expect(content.length).to be > 500

	expect(post_div.has_css?('.read_more_link')).to be_falsy
end

Then(/^il titolo del post è "([^"]*)"$/) do |post_title|
	expect do
		steps_helper.post_div_by_title(page, post_title)
	end.not_to raise_error
end

Then(/^il contenuto del titolo include "([^"]*)"$/) do |partial_content|
	post_div = steps_helper.post_divs(page)[0]
	content = post_div.find('.post_content').text
	expect(content).to include(partial_content)
end

Then(/^tramite l'intestazione posso autenticarmi$/) do
	step 'è presente l\'intestazione'
	expect(@header.has_link?('Login')).to be_truthy
end

Then(/^l'utente è autenticato$/) do
	expect(page.has_link?('log_out_link')).to be_truthy
	expect(page.has_link?('log_in_link')).to be_falsy
end

And(/^tramite l'intestazione non posso autenticarmi$/) do
	step 'è presente l\'intestazione'
	expect(@header.has_link?('log_in_link')).to be_falsy
end

And(/^tramite l'intestazione posso disconnettermi$/) do
	step 'è presente l\'intestazione'
	expect(@header.has_link?('log_out_link')).to be_truthy
end

Then(/^posso navigare verso la pagina per la creazione di un nuovo post$/) do
	expect(page.all('.new_post_link').length).to be >= 0
end

Then(/^non posso navigare verso la pagina per la creazione di un nuovo post$/) do
	expect(page.all('.new_post_link').length).to be eq(0)
end

Then(/^compare l'errore di autenticazione "([^"]*)"$/) do |error_message|
	expect(page.has_css?('#flashnotice')).to be_truthy
	expect(page.has_content?(error_message)).to be_truthy
end


Then(/^è presente il logo$/) do
	step 'è presente il pié di pagina'
	expect(@footer.has_css?('img')).to be_truthy
	expect(@footer.has_css?('#woodstock')).to be_truthy
	steps_helper.take_screenshot page
end