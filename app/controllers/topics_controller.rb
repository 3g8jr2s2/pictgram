class TopicsController < ApplicationController
  def index
    # Topic.allでTopicモデル内の全レコードを@topicsへ代入
    # app/views/topics/index.html.erb の <@topics.each do |topic|> 内で、
    # 「topic.user.name」「topic.image.url」「topic.description」の表示処理を行っている
    @topics = Topic.all
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
