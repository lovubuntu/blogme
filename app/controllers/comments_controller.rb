class CommentsController < ApplicationController
  before_action :set_comments
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET bloggers/1/comments
  def index
    @comments = @blogger.comments
  end

  # GET bloggers/1/comments/1
  def show
  end

  # GET bloggers/1/comments/new
  def new
    @comment = @blogger.comments.build
  end

  # GET bloggers/1/comments/1/edit
  def edit
  end

  # POST bloggers/1/comments
  def create
    @comment = @blogger.comments.build(comment_params)

    if @comment.save
      redirect_to([@comment.blogger, @comment], notice: 'Comment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT bloggers/1/comments/1
  def update
    if @comment.update_attributes(comment_params)
      redirect_to([@comment.blogger, @comment], notice: 'Comment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE bloggers/1/comments/1
  def destroy
    @comment.destroy

    redirect_to blogger_comments_url(@blogger)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @blogger = Blogger.find(params[:blogger_id])
    end

    def set_comment
      @comment = @blogger.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
