class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def index
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post 	#show page
  	else
  		render 'new'
  	end

  end

  def edit

  end

  def update
  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end


  def find_post
	@post = Post.find(params[:id])
  end

  def show
  	
  end


  private

  def post_params
  	params.require(:post).permit(:title, :body)
  end

end
