class RepliesController < ApplicationController
  before_action :authenticate_user!

  def index
    @replies = Reply.all
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @reply = Reply.new(reply_params)
    @post = Post.find(params[:post_id])
    @reply.post_id = @post.id
    #@receiver = User.where(id:@reply.post.user_id)
    #大久保さんに聞いたやつ
    #@receiver = User.find_by!(id:@reply.post.user_id)
    @receiver = @reply.post.user
    if @reply.save
      #通知メソッドの呼び出し
      @reply.create_notification_by(current_user)
      flash[:notice] = "返事が作られました!"
      NotificationMailer.notification_email(@receiver).deliver
      redirect_to root_path
    else
      render "new"
    end

    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors



  end


      private
        def reply_params
          params.require(:reply).permit(:dear, :content, :from, :post_id)
        end
end