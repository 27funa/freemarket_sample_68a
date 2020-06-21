class CreditsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :authenticate_user!
  
  def index
    # すでにクレジットカードが登録しているか？
    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.payjp_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      # クレジットカードの画像を表示するために、カード会社を取得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
      case @card_brand
      when "Visa"
        @card_image = "visa.svg"
      when "JCB"
        @card_image = "jcb-emblem-logo.svg"
      when "MasterCard"
        @card_image = "mc_vrt_pos.svg"
      when "American Express"
        @card_image = "american_express.svg"
      when "Diners Club"
        @card_image = "diners-club-international.svg"
      when "Discover"
        @card_image = "Discover-Card.svg"
      end
    end
  end

  def new
    # cardがすでに登録済みの場合、indexのページに戻します。
    @card = Credit.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?    
  end

  def create
    # PAY.JPの秘密鍵をセット（環境変数）
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]

    # jsで作成したpayjpTokenがちゃんと入っているか？
    if params['payjpToken'].blank?
      # トークンが空なら戻す
      render "new"
    else
      # トークンがちゃんとあれば進めて、PAY.JPに登録されるユーザーを作成します。
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )

      # PAY.JPのユーザーが作成できたので、creditcardモデルを登録します。
      @card = Credit.new(user_id: current_user.id, payjp_id: customer.id)
      if @card.save
        flash[:notice] = "カード登録が完了しました。"
        redirect_to action: "index"
      else
        flash.now[:alert] = "カード情報が正しくありません。"
        render 'new'
      end
    end
  end

  def destroy
    # 今回はクレジットカードを削除するだけでなく、PAY.JPの顧客情報も削除する。これによりcreateメソッドが複雑にならない。
    # PAY.JPの秘密鍵をセットして、PAY.JPから情報をする。
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    # PAY.JPの顧客情報を取得
    customer = Payjp::Customer.retrieve(@card.payjp_id)
    customer.delete # PAY.JPの顧客情報を削除
    if @card.destroy # App上でもクレジットカードを削除
      flash[:notice] = "カード情報を削除しました。"
      redirect_to action: "index"
    else
      flash.now[:alert] = "カード情報を削除できませんでした。"
      redirect_to action: "index"
    end
  end

  private
  def set_card
    @card = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end
end