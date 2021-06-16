class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @user_friends = @user.friends


    @friend_hash = {}
    @user.friends.each do |friend|
      name = friend.name
      @friend_hash[name] = friend.points
    end

    user_name = @user.name
    user_points = @user.points
    @friend_hash[user_name] = user_points
    @sorted_friends = @friend_hash.sort_by{|k, v| -v}

    @attempts = Attempt.where(user: @user).order(start_time: :desc)

  end
end
