class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  # NOTE: try and always use show when routing to conversations/index (to maintain modularity)
  def show
    # puts "show's being called yo!"
    # @messages = Message.where(conversation_id: params[:id])
    # @messages = Message.all
  end


  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
    # Not for this iteration
  end

  # POST /messages
  # POST /messages.json
  def create
    # Associate text body with this message's body
    if params[:message][:content] != "" and params[:message][:content] != nil
      @message = Message.create!(content: params[:message][:content], conversation_id: params[:message][:conversation_id])
      @conversation = Conversation.find(params[:message][:conversation_id])
      # @messages = Message.where(conversation_id: @conversation.id)
      # respond_to do |format|
      #   if @message.save
      #     format.html { redirect_to @message, notice: 'Message was successfully created.' }
          # format.json { render :show, status: :created, location: @message }
      #   else
      #     # format.html { redirect_to @message, notice: 'Message was not able to be sent.' }
      #     # format.json { render :show, status: :created, location: @message }
      #   end
      # end
      respond_to do |format| 
        if @message.save
            # format.json { render :json => current_user.profile.avatar_url, :status => 200 } 
            format.html { render :nothing => true, :notice => 'Update SUCCESSFUL!' } 
        else 
            format.html { render :action => "edit" } 
            # format.json { render :json => current_user.errors, :status => :unprocessable_entity } 
        end 
      end 
    else
      flash[:notice] = "Please enter in a message"
      # redirect_to :back
    end
    
    # redirect_to '/conversations'
    
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end