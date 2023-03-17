class PostsController < ApplicationController
    def create
        post = Post.create(post_params)
        if post.valid?
          render json: post, status: :created
        else
            render_not_found_response
        end
      end

      private

  def post_params
    params.permit(:title, :content, :summary, :category)
  end

  def render_not_found_response
    render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
  end

end
