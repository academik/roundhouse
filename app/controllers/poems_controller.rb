class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]

  # GET /poems
  # GET /poems.json
  def index
    @poems = Poem.all
  end

  # GET /poems/1
  # GET /poems/1.json
  def show
  end

  # GET /poems/new
  def new
    @poem = Poem.new
  end

  # GET /poems/1/edit
  def edit
  end

  # POST /poems
  # POST /poems.json
  def create
    @poem = Poem.new(poem_params)
    if @poem.save
      redirect_to @poem, notice: 'Poem was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /poems/1
  # PATCH/PUT /poems/1.json
  def update
    if @poem.update(poem_params)
      redirect_to @poem, notice: 'Poem was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    @poem.destroy
    redirect_to poems_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poem_params
      params.require(:poem).permit(:poet_id, :venue_id, :organization_id, :title, :link, :date, :text, :city, :state, :country)
    end
end
