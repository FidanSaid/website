class HomeController < ApplicationController
  def index
  end
  
  def about
  end
  
  def contacts
     @message = Message.new
  end 
  
  def blog
  end
  
  def portfolio
  end
  
   def index
    @message = Message.new
   end
   
   def new
    @message = Message.new
   end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end
def show 
  @message= Message.find(params[:id]) 
end
private

  def message_params
    params.require(:message).permit(:name, :email, :content , :message)
  end

end
