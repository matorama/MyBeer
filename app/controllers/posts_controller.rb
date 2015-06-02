class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def home
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 20)
    @posts = @posts.where("name like ?", "%#{params["beer"]}%") if params["beer"].present?
    @posts = @posts.where("brewery like ?", "%#{params["brewery"]}%") if params["brewery"].present?
    @posts = @posts.where("style like ?", "%#{params["style"]}%")if params["style"].present?
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # @post = Post.find(params[:id])

    @review = Review.new
    @review.post_id = @review.id

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :brewery, :description, :style, :abv, :label)
    end
end
