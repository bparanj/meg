class PeopleController < ApplicationController
  def index
    @people = Person.limit(10)
  end
end
