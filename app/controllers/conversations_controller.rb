class ConversationsController < ApplicationController

  # DUMMY FOR THE DUMMY PUSH
  load_and_authorize_resource

  # GET /conversations
  # GET /conversations.json


  def index
 
    @conversations = Conversation.all
    # gets the latest message that hasn't been displayed yet/that's just been created
    # using after_id, the id of the last displayed message
    # @messages = Message.where('id > ?', params[:after_id].to_i).order('created at DESC')
    puts("yo")
    @messages = []
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @messages = Message.where(conversation_id: params[:id])
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
    gon.conversation_id = @conversation.id
    @messages = Message.where(:conversation_id => params[:id])

    # if request.xhr? 
    #   puts "we did a ajax yay"
    #   @messages = Message.where(conversation_id: params[:id])
    #   render :partial => 'messages', :object => @messages
    #   # render(:partial => 'message', :collection => @messages)
    # else    
    #   # ***** make sure to explicitly pass a value in params for conversation_id!

    #   @messages = Message.where(:conversation_id => params[:id])
    # end
  end

  # POST /conversations
  # POST /conversations.json
  # deprecated ?
  def create
    @conversation = Conversation.new(conversation_params)
    # @message = Message.create!(content: "Your chat has started.", conversation_id: @conversation.id)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to edit_conversation_url(@conversation), notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      # @messages = Message.where(conversation_id: params[:id])
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.fetch(:conversation, {})
    end
end