class VisitorsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to list_url
    end
  end
end
