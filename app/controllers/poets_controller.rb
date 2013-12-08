class PoetsController < ApplicationController
  before_action :set_poet, only: [:show, :edit, :update, :destroy]

  # GET /poets
  # GET /poets.json
  def index
    @poets = Poet.all
  end

  # GET /poets/1
  # GET /poets/1.json
  def show
  end

  # GET /poets/new
  def new
    @poet = Poet.new
  end

  # GET /poets/1/edit
  def edit
  end

  # POST /poets
  # POST /poets.json
  def create
    @poet = Poet.new(poet_params)
    if @poet.save
      redirect_to @poet, notice: 'Poet was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /poets/1
  # PATCH/PUT /poets/1.json
  def update
    @poet.facebook = @poet.facebook.split("/").last if 
    if @poet.update(poet_params)
      redirect_to @poet, notice: 'Poet was successfully updated.'
    else
      render action: 'edit'
    end
  end # --- def update --- 

  # DELETE /poets/1
  # DELETE /poets/1.json
  def destroy
    @poet.destroy
    redirect_to poets_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poet
      @poet = Poet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poet_params
      params.require(:poet).permit(:first_name, :last_name, :email, :website, :bio, :facebook, :twitter, :tumblr, :youtube)
    end
end
