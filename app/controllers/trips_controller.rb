class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json 

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.find(:all)
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    redirect_to root_url
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    unless @trip.user == current_user
      redirect_to root_url
    end
  end

  # GET /trips/new
  def new
    redirect_to root_url
  end

  # GET /trips/1/edit
  def edit
    if !logged_in?
      redirect_to root_path, :flash => { :error => "Make sure you're logged in!" }
    elsif !trip_author?
      redirect_to root_url, :flash => { :error => "You can't edit someone else's trip!" }
    end
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        @trip.mail (render_to_string('user_mailer/traveljournal', :layout => false))
        format.html { redirect_to current_user, notice: 'Trip was successfully created. Your details will arrive shortly!' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to current_user, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    if (logged_in? && trip_author?) 
      @trip.destroy
      redirect_to current_user
    else
      redirect_to root_url, :flash => { :error => "You can't delete someone else's trip!" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:trip_name, :location, :user_id, :date, :to_pack, :to_do, :budget, :things_i_did, :things_i_liked, :things_i_didnt_like, :supply_ids => [], :supplies_attributes => [:id, :name])
    end

    def trip_author?
      @trip.user == current_user
    end
end
