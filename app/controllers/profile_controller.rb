class ProfileController < ApplicationController

  def new
  end

  def signup
        @p = Profile.new(:username => params[:username])
        @p.password = params[:password]
        @p.save
        redirect_to "/"
  end

  def index
  end

  def sign
    @p = Profile.find(:username => params[:username], :password => params[:password]).first
    if(!@p.nil?)
        session[:username] = params[:username]
        redirect_to "/sites"
    else
        redirect_to "/"
    end
  end

  def logout
        session[:username]=''
        redirect_to "/"
  end

end
