class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:friend_form][:user_id])

    @user.friend_request current_user

    if current_user.friends_with?(@user) || current_user.id == @user.id

    else
      current_user.accept_request(@user)
    end

    redirect_back(fallback_location: user_path(current_user))
  end

  def destroy
    @user = User.find(params[:friend_form][:user_id])

    if current_user.friends_with?(@user)
      @user.remove_friend(current_user)
    else
      #TODO - don't know how to throw error
    end
    redirect_back(fallback_location: user_path(current_user))
  end
end
