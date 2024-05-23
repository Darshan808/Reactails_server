class PostsController < ApplicationController
    before_action :set_post, only: %i[update]
    #GET /posts
    def index
        @posts = Post.all
        render json: @posts
    end

    def create
        @post = Post.new(post_params)
        if @post.save
          render json: @post, status: :created, location: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
    end

    #PATCH/PUT /posts/:id
    def update
      if @post.update(post_params)
        render json: @post, status: :ok
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
    def set_post
      @post = Post.find(params[:id])
    end
end
