class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @user_friends = @user.friends
    @sorted_friends_ascen = @user_friends.sort_by &:points
    @sorted_friends = @sorted_friends_ascen.reverse
  end
end
