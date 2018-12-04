class WsauthorsController < ApplicationController
    before_action :set_author, only: [:show, :update, :destroy]
    
    soap_service namespace: 'urn:WashOutAuthors', camelize_wsdl: :lower

    soap_action "index",
                :return => :authors
    def index
      @authors = Author.all
      render :soap => @authors
    end
    
    soap_action "show",
                :args   => { :username => :string},
                :return => :author
    def show
        render :soap => @author
    end
  
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_author
          @author = Author.where(username: params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def author_params
          params.require(:author).permit(:username, :name, :projects)
        end
end