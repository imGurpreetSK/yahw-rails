class RootController < ApplicationController

  def root
    redirect_to articles_path if logged_in?
  end
end
