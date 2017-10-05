class DestinationController < ApplicationController
  def new
    @destination = Destination.new
  end
end