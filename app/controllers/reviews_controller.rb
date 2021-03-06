class ReviewsController < ApplicationController
  def create
    # @post = Post.find(params[:id])
    # @review = @post.reviews.new(params.require(:review).permit(:score, :aroma, :appearance, :taste, :palate, :overall))
    # @review.save
    # redirect_to post_path(@post)

	  @review = Review.new(params.require(:review).permit(:score, :aroma, :appearance, :taste, :palate, :overall))
	  @review.post_id = params[:post_id]

	  @review.save

	  redirect_to post_path(@review.post)


  end


  def new
  	@post = Post.find(params[:post_id])
  	@review = Review.new

  end

  def destroy

      @post = Post.find(params[:post_id])
      @review = Review.find(params[:id])

  		# @review = Review.find(params[:id])
  		@review.destroy

   	  redirect_to post_path(@review.post)
  end


  def edit
  	  @post = Post.find(params[:post_id])
      @review = Review.find(params[:id])
  end


  def update
		  @review = Review.find(params[:id])
		  @review.update(params.require(:review).permit(:score, :aroma, :appearance, :taste, :palate, :overall))

		  redirect_to post_path(@review.post)
	end

end
