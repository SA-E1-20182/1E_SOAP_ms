class WsauthorsController < ApplicationController
  soap_service namespace: 'urn:WashOutAuthors', camelize_wsdl: :lower

    soap_action "index",
                :return => { :authors => :Author}
    def index
      q = Author.all
      render :soap => { :authors => q.authors }
    end
    
    soap_action "show",
                :args   => { :username => :string },
                :return => { :name => :Author, :username => :Author, :projects => :Author }
    def show
      q = Author.where(username: params[:username]).first
      render :soap => { :name => q.name, :username => q.username, :projects => q.projects}
    end
    
end