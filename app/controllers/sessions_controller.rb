class SessionsController < ApplicationController
	def new
	end

	def create
		author = Author.authenticate(params[:email], params[:hpassword])
		if author
			session[:author_id] = author.id
			redirect_to :root, :notice => 'Login effettuato, benvenuto!'
		else
			#flash.now.alert = 'Credenziali invalide.'
			redirect_to :log_in, :notice => 'Credenziali invalide.'
		end
	end

	def destroy
		session[:author_id] = nil
		redirect_to :root, :notice => 'Arrivederci!'
	end
end
