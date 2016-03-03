class CommentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@comment.user  = current_user
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @product, notice: 'Review was created successfully.' }
			else
				format.json { render :show, status: :created, location: @product }
				format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end	
		end
	end


	def destroy
		@comment = Comment.find(params[:id])
		product = @comment.product
		@comment.destroy
		redirect_to product
	end

	private

		def comment_params
			params.require(:comment)
				.permit(:body, :rating)
		end
end