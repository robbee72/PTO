class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
     @user = User.find(session[:user_id]).name
     @user.name = params[:user][:name]
     @user.user_number = params[:user][:user_number]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]

     if @user.save
       flash[:notice] = "Home to RTI inc. #{@user.name}!"
       create_session(@user)
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end

     # POST /users
  # POST /users.json

    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


   def index
     @users = User.all
     @users = User.all_except(current_user)
     authorize @users
   end

   def update
     user = User.find(params[:id])
     user.role = params[:user][:role]
     if user.save!
       flash[:notice] = "#{user.name} updated successfully."
     else
       flash[:alert] = "#{user.name} failed to update."
     end
     redirect_to users_path
   end

   def edit
   end

   def destroy
     @user = User.all
   end

   def show
     @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
   end

end
