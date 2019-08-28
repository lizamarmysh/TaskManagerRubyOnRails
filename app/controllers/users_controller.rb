class UsersController < ApplicationController
	# http_basic_authenticate_with name: "user", password: "1234", except: [:index, :show]
	def index 
		@users = User.all
	end

	def sign_in
		@users = User.where("email ||''|| password like ?","%#{params[:search]}%") if params[:search].present?
		redirect_to users_path
		
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if (@user.update(user_params))
			redirect_to @user
		else
			render 'new'
		end
	end

	def destroy
		@user = User.find(params[:id])

		@user.destroy

		redirect_to users_path
	end

	def create
		# render plain: params[:user].inspect
		@user = User.new(user_params)
		
		if (@user.save)
			redirect_to @user
		else
			render 'new'
		end
	end

	private def user_params
		params.require(:user).permit(:name, :surname, :email, :password, :status)
	end
end
