class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
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
  # def create
  #    @user = User.new
  #    @user.name = params[:user][:name]
  #    @user.user_number = params[:user][:user_number]
  #    @user.email = params[:user][:email]
  #    @user.password = params[:user][:password]
  #    @user.password_confirmation = params[:user][:password_confirmation]
  #
  #    if @user.save
  #      flash[:notice] = "Welcome to RTI inc. #{@user.name}!"
  #      create_session(@user)
  #      redirect_to root_path
  #    else
  #      flash.now[:alert] = "There was an error creating your account. Please try again."
  #      render :new
  #    end
  #  end

   def index
     @user = User.all
   end
   def edit
   end
   def show
     @user = User.find(params[:id])
   end
end
