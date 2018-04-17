class MessesController < ApplicationController
  before_action :set_mess, only: [:show, :edit, :update, :destroy, :join, :leave]

  # GET /messes
  # GET /messes.json

  def index
    @messes = Mess.all
  end

  # GET /messes/1
  # GET /messes/1.json
  def show
  end

  # GET /messes/new
  def new
    @mess = Mess.new
  end

  # GET /messes/1/edit
  def edit
  end

  # POST /messes
  # POST /messes.json
  def create
    @mess = Mess.new(mess_params)

    respond_to do |format|
      if @mess.save
        format.html { redirect_to @mess, notice: 'Mess was successfully created.' }
        format.json { render :show, status: :created, location: @mess }
      else
        format.html { render :new }
        format.json { render json: @mess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messes/1
  # PATCH/PUT /messes/1.json
  def update
    respond_to do |format|
      if @mess.update(mess_params)
        format.html { redirect_to @mess, notice: 'Mess was successfully updated.' }
        format.json { render :show, status: :ok, location: @mess }
      else
        format.html { render :edit }
        format.json { render json: @mess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messes/1
  # DELETE /messes/1.json
  def destroy
    @mess.destroy
    respond_to do |format|
      format.html { redirect_to messes_url, notice: 'Mess was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ####### JOINING AND LEAVING A MESS #########

  def join
    @user = current_user
    @mess = Mess.find(params[:id])
    @mess_id = @mess.id
    @user.update_attributes(:mess_id => @mess_id)
    redirect_to @mess
  end

  def leave
    @mess = Mess.find(mess_params)
    current_user.update_attributes(:mess_id, nil)
    redirect_to @mess
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mess
      @mess = Mess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mess_params
      params.require(:mess).permit(:name, :address, :postcode, :user_id, :id, :mess_id)
    end
end
