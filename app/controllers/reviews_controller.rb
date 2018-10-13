class ReviewsController < ApplicationController
  before_filter :authorize
  def new
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    puts reviews_params
    review = @product.reviews.new(reviews_params)
    review.user = current_user

    if review.save
      redirect_to @product
    end

  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to @review.product, notice: 'Review deleted'
  end

  private
  def reviews_params
    params.require(:review).permit(
    :description,
    :rating)

  end


end
