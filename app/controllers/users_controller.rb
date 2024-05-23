class UsersController < ApplicationController
  def index
    @users = User.all
    print @users
    print "Here"
    render json: @users
  end

  def create
    User.create(params.require(:user).permit(:name,:age))
    render status: :created
  end
end
