class AccountsController < ApplicationController
  before_action :login_required

  def show
    @member = current_member
  end

  def edit
    @member = current_member
    @member.build_image unless @member.image
  end

  def update
    @member = current_member
    @member.assign_attributes(account_params)
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  private
  def account_params
    attrs = [:number, :name, :full_name, :gender, :birthday, :email,
      :password, :password_confirmation]
    attrs << { image_attributes: [:_destroy, :id, :uploaded_image] }
    params.require(:account).permit(attrs)
  end
end
