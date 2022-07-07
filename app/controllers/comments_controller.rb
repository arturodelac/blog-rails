class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        
        @comment = @article.comments.create(comment_params)
        if @comment.update(comment_params)
            redirect_to @article
          else
            render @article.comments, status: :unprocessable_entity
          end
      end
    

      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: 303
      end
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
