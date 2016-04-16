class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to new_session_path, notice: "Signed up!"
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
		unless current_user == @user
			flash[:notice] = "Wrong ID"
			redirect_to root_url
		end
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			redirect_to user_url(@user)
		else
			render 'edit'
		end
	end


	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_url
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation)
	end
end
