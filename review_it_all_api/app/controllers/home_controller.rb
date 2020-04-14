class HomeController < ApplicationController
        
    def index
      render file: 'review_it_all_frontend/index.html'
    end
    
end