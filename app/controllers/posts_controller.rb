class PostsController < ApplicationController
 before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_sign_in, except: :show
include SessionsHelper

  def index
    @posts = Post.all
    if user_signed_in?
      redirect_to posts_path
    else
      redirect_to new_user_session_path
    end
  end

  # GET /posts/1
  def show
      @posts = Post.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end
  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    respond_to do |format|
    if @post.save
      format.html { redirect_to @post, notice: "Post was successfully created." }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
    @event = Event.find(params[:event_id])
     @post.user = current_user
     @post = @event.posts.build(post_params)
  end
end


  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

     if @post.save
       flash[:notice] = "Post was updated successfully."
       redirect_to [@post.topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end


  # DELETE /posts/1
  def destroy
    @posts = Post.all
    @post.delete
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :content)
    end

  #  def authorize_user
  #    post = Post.find(params[:id])
   #
  #    unless current_user == post.user || current_user.admin?
  #      flash[:alert] = "You must be an admin to do that."
  #      redirect_to [post.event, post]
  #    end
   #end
  end
