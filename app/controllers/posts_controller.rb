class PostsController < ApplicationController

  before_action :set_post , only:[:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index]
  before_action :require_creator, only: [:edit, :update]

  def vote
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = 'Your vote was counted.'
        else
          flash[:error] = 'You can only vote on a post once.'
        end
        redirect_to :back
      end
      format.js
    end

  end

  def index
  # @posts =  Post.all
  @posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end


  def show
    # before action :set post creates @post instance var:
    @comment = Comment.new
  end

  def new
   @post = Post.new
  end

  def create

    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice]  = "Post was created successfully."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    # before action :set post creates @post instance var:
  end

  def update
    # before action :set post creates @post instance var:
      if @post.update(post_params)
         flash[:notice]  = "The post was updated."
        redirect_to posts_path
      else
        render :edit
      end

  end

  private
  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find_by(slug: params[:id])
  end


  def require_creator
    access_denied unless logged_in? and (current_user == @post.creator || current_user.admin?)
  end

end
