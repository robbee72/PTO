class MailerUsersController < ApplicationController
  before_action :set_mailer_user, only: [:show, :edit, :update, :destroy]

  # GET /mailer_users
  def index
    @mailer_users = MailerUser.all
  end

  # GET /mailer_users/1
  def show
  end

  # GET /mailer_users/new
  def new
    @mailer_user = MailerUser.new
  end

  # GET /mailer_users/1/edit
  def edit
  end

  # POST /mailer_users
  def create
    @mailer_user = MailerUser.new(mailer_user_params)

    if @mailer_user.save
      redirect_to @mailer_user, notice: 'Mailer user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mailer_users/1
  def update
    if @mailer_user.update(mailer_user_params)
      redirect_to @mailer_user, notice: 'Mailer user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mailer_users/1
  def destroy
    @mailer_user.destroy
    redirect_to mailer_users_url, notice: 'Mailer user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailer_user
      @mailer_user = MailerUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mailer_user_params
      params.require(:mailer_user).permit(:name, :email, :login)
    end
end
