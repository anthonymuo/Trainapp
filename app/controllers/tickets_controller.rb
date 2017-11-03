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
    
    
       #creating a new booking
    def create
    @book = Ticket.new(book_params)
    if @book.save
    redirect_to new_ticket_path
      flash[:success] = "You have successfully booked"
    else
      render 'new'
    end
    end


   #strong parameters
    def book_params
    params.require(:ticket).permit(:started, :ended, :day)
    end
    

  
end
