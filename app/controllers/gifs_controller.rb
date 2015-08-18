class GifsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_gif, only: [:show, :edit, :update, :destroy]


  # GET /gifs
  # GET /gifs.json
  def index
    @gifs = Gif.order("created_at DESC")
    @gif = Gif.new
  end

  # GET /gifs/1
  # GET /gifs/1.json
  def show
  end

  # GET /gifs/new
  def new
    if user_signed_in?
      @gif = Gif.new
    else
      flash[:notice]='Please sign in'
      redirect_to new_user_session_path
    end

  end

  # GET /gifs/1/edit
  def edit
  end

  # POST /gifs
  # POST /gifs.json
  def create
    @gif = Gif.new(gif_params)
    @gif.user_id = current_user.id

    respond_to do |format|
      if @gif.save
        format.html { redirect_to gifs_path, notice: 'Gif was successfully created.' }
        format.json {  }
      else
        format.html { render :new }
        format.json {  }
      end
    end
  end

  # PATCH/PUT /gifs/1
  # PATCH/PUT /gifs/1.json
  def update
    respond_to do |format|
      if @gif.update(gif_params)
        format.html { redirect_to @gif, notice: 'Gif was successfully updated.' }
        format.json { render :show, status: :ok, location: @gif }
      else
        format.html { render :edit }
        format.json { render json: @gif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifs/1
  # DELETE /gifs/1.json
  def destroy
    @gif.destroy
    respond_to do |format|
      format.html { redirect_to gifs_url, notice: 'Gif was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gif
      @gif = Gif.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gif_params
      params.require(:gif).permit(:user_id, :description, :picture, :file )
    end
end
