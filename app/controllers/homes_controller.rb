class HomesController < ApplicationController
  def index
    @homes= Book.all
  end
  
end
