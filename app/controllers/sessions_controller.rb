class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email:params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Loggen in successfully"
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong with your account details"
            render 'new'
        end
    end

    def destroy
    end
end