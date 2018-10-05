class CitiesController < ApplicationController
  def view
    #$cities = $cities.clear
    city_name = params[:city]
    if city_name
      if $cities.key?(city_name)
        @cities = [$cities[city_name.to_sym]]
      else
        @cities = $cities.values
      end
    else
      @cities = $cities.values
    end
  end

  def new
  end

  def create
    name = params[:name]
    if !$cities.key?(name)
      city = City.new(params)
      city.save
    end
    redirect_to '/cities/view'

  end

  def update
    @name = params[:name]
    @landmark = params[:landmark]
    @population = params[:population]
  end

  def update_post
    name = params[:name]
    landmark = params[:landmark]
    population = params[:population]
    @current_city = $cities[name.to_sym]
    if !landmark.nil? && !landmark.empty?
      @current_city.update({:landmark => landmark})
    end
    if !population.nil? && !population.empty?
      @current_city.update({:population => population})
    end
    redirect_to '/cities/view'
  end
end