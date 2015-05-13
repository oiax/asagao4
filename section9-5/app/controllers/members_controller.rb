class MembersController < ApplicationController
  before_action :login_required

  # 会員一覧
  def index
    @members = Member.order("number")
      .paginate(page: params[:page], per_page: 15)
  end

  # 検索
  def search
    @members = Member.search(params[:q])
      .paginate(page: params[:page], per_page: 15)
    render "index"
  end

  # 会員情報の詳細
  def show
    @member = Member.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "show"
    end
  end

  private
  # 画像送信
  def send_image
    if @member.image.present?
      send_data @member.image.data,
        type: @member.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end
