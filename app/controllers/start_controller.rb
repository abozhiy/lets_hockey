class StartController < ApplicationController

  def redirect
    redirect_to users_path
  end
end
