class EndUsersController < ApplicationController
	def show
	end

	def edit
	end

	def update
		 @end_user = current_end_user
		 if @end_user.update
		 	@end_user.sign_out
		 	redirect_to items_path
		 end
	end

	def withdraw
	end

	def destroy
	end

	private
	 def end_user_params
		params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :encrypted_password, :is_deleated)
	 end
end

