class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def eldest
    @oldest = Director.order(:dob).first.name

    render({ :template => "director_templates/eldest"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({:id => the_id})
    @the_director = matching_records.at(0)
    
    render({ :template => "director_templates/details"})
  end

  def youngest
    @youngest = Director.order(:dob).last.name

    render({ :template => "director_templates/youngest"})
  end

end
