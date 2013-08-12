class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def matching_offers


    @trip = Trip.find(params[:id])
    @trip_on_time=@trip.on_station_time.split(':')[1].to_f/60 +@trip.on_station_time.split(':')[0].to_f
    @trip_off_time=@trip.off_station_time.split(':')[1].to_f/60 +@trip.off_station_time.split(':')[0].to_f
    @duration=@trip.wifi_duration.to_f/60
    @offers=Offer.all
    @offers_a = []

      @offers.each do |offer|
        @offer_on_time=offer.on_station_time.split(':')[1].to_f/60 +offer.on_station_time.split(':')[0].to_f
        @offer_off_time=offer.off_station_time.split(':')[1].to_f/60 +offer.off_station_time.split(':')[0].to_f

        if @offer_off_time - @offer_on_time > @duration && @offer_on_time<@trip_off_time-@duration
          @offers_a.push(offer)
        end
      end
      return @offers_a



      # offer_a.each do |offer|
      #   @offer_b = []
      #   if offer.on_station_time <= trip.on_station_time and offer.off_station_time>= trip.on_station_time+wifi_duration
      #     offer_b.push(offer)
      #   end
      # end

      # offer_b.each do |offer|
      #   @matching_offers = []
      #   if offer.on_station_time>= trip.on_station_time and offer.off_station_time>=trip.on_station_time
      #     matching_offers.push(offer)
      #   end
      # end
    end




  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.create(params[:trip])
    @start_time=@trip.on_station_time
    @start_station=@trip.on_station
    @matching_trains=Train.where("schedule-> '#{@start_time}' = '#{@start_station}'")
    @train_id=@matching_trains.first.id
    @stop_time=@matching_trains.first.schedule.key(@trip.off_station)



    respond_to do |format|
      if @trip.update_attributes(:train_id=>@train_id, :off_station_time=>@stop_time)
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
