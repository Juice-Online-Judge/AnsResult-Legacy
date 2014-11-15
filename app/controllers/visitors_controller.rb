class VisitorsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to lists_url
    else
      redirect_to new_user_session_path
    end
  end
end
