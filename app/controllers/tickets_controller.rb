class TicketsController < ApplicationController
    
    #show all result
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
