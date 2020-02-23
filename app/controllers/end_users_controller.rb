class EndUsersController < ApplicationController
  def edit
    @end_user = EndUser.find( current_user.id )
  end

  def update
    end_user = EndUser.find( current_user.id )
    end_user.update( end_user_params )
    redirect_to end_users_path
  end

  def show
    @end_user = EndUser.find( current_user.id )
  end

  private
  def end_user_params
    params.require( :end_user ).permit( :first_name, :last_name, :first_name_kana,
      :last_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted )
    end
end
