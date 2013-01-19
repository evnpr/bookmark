class ProfileController < ApplicationController

#
  def new
  end

  def signup
        @p = Profile.new(:username => params[:username])
        @p.password = params[:password]
        @p.save
        redirect_to "/"
  end

  def index
        if(!session[:username].nil?)
            redirect_to "/sites" and return
        end
  end

  def sign
    @p = Profile.where(:username => params[:username], :password => params[:password]).first
    if(!@p.nil?)
        session[:username] = params[:username]
        redirect_to "/sites"
    else
        redirect_to "/"
    end
  end

  def logout
        session[:username]= nil
        redirect_to "/"
  end

  def cat
        @category = Category.find(params[:id]).title
        render :layout => 'nothing' and return
  end

end
