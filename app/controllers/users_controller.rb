class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	# Added this line to try to fix Active Model Forbidden attributes error
  	params.permit!
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_url, :notice => "Signed up!" and return # added "and returned trying to fix double render error"
    else
 		render "new"
  	end
  end
end
