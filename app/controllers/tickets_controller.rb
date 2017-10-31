class TicketsController < ApplicationController
    
    def index
    @book=Ticket.all 
    end
            
            
    def show
    
    end
           #new booking form
    def new
    @book=Ticket.new
    end

end
