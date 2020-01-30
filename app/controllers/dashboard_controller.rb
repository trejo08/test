class DashboardController < ApplicationController
  def index
    @artists = Artist.all
  end
end
