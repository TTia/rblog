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
	@header.should eql?(header)
end

Then(/^il piè di pagina è posizionato alla fine$/) do
	footer = page.find(:xpath, 'descendant::body/*[last()]')
	@footer.should eql?(footer)
end

Then(/^intestazione e pié di pagina hanno lo stesso colore di sfondo$/) do
	@header_background.should eq(@footer_background)
end

Then(/^posso navigare verso "([^"]*)"$/) do |page_name|
	link_names = @links.map { |link|	link.text }
	link_names.should include(page_name)
end

Then(/^il titolo della pagina è uguale al (.*)$/) do |page_name|
	page_name.should eq(@page_title)
end

Then(/^lo sfondo del collegamento cambia$/) do
	@pre_color.should_not eq(@color)
end