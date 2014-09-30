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
	footer = page.find(:xpath, 'descendant::body/*[last()]')
	expect(@footer).to eq(footer)
end

Then(/^intestazione e pié di pagina hanno lo stesso colore di sfondo$/) do
	expect(@header_background).to eq(@footer_background)
end

Then(/^posso navigare verso "([^"]*)"$/) do |page_name|
	link_names = @links.map { |link|	link.text }
	expect(link_names).to include(page_name)
end

Then(/^il titolo della pagina è uguale al (.*)$/) do |page_name|
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

Then(/^il post "([^"]*)" è leggibile su RBlog$/) do |post_title|
	step 'apro RBlog'
	expect do
		post_div = steps_helper.post_div_by_title page, post_title
		expect(post_div).not_to be_nil
	end.not_to raise_error
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