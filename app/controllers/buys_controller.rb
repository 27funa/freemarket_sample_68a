class BuysController < ApplicationController
  before_action :authenticate_user!
  
  def index
    userCard = Credit.includes(:user)
    @userCard = userCard.find_by(user_id: current_user.id)
    @post = Post.find(params[:post_id])
    @deli_info = DeliveryInformation.all

    if @userCard.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@userCard.payjp_id)
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
          @card_image = "jcb.svg"
        when "MasterCard"
          @card_image = "mc_vrt_pos.svg"
        when "American Express"
          @card_image = "american_express.svg"
        when "Diners Club"
          @card_image = "dinersclub.svg"
        when "Discover"
          @card_image = "discover.svg"
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    userCard = Credit.includes(:user)
    @userCard = userCard.find_by(user_id: current_user.id)
    # 今回はクレジットカードを削除するだけでなく、PAY.JPの顧客情報も削除する。これによりcreateメソッドが複雑にならない。
    # PAY.JPの秘密鍵をセットして、PAY.JPから情報をする。
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    # PAY.JPの顧客情報を取得
    customer = Payjp::Customer.retrieve(@userCard.payjp_id)
    customer.delete # PAY.JPの顧客情報を削除
    if @userCard.destroy # App上でもクレジットカードを削除
      flash[:notice] = "カード情報を削除しました。"
      redirect_to post_buys_path(@post)
    else
      flash.now[:alert] = "カード情報を削除できませんでした。"
      redirect_to post_buys_path(@post)
    end
  end

  def buy
    userCard = Credit.includes(:user)
    @userCard = userCard.find_by(user_id: current_user.id)
    @post = Post.find(params[:post_id])
    @deli_info = DeliveryInformation.all
    if @userCard.blank? && @deli_info.present?
      # カード情報がなければ買えない
      redirect_to post_buys_path(@post)
      flash[:alert] = '購入にはクレジットカード登録が必要です。'
    elsif @deli_info.blank? && @userCard.present?
      # カード情報がなければ買えない
      redirect_to post_buys_path(@post)
      flash[:alert] = '配送先情報を入力してください。'
    elsif @userCard.blank? && @deli_info.blank?
      # カード情報がなければ買えない
      redirect_to post_buys_path(@post)
      flash[:alert] = 'クレジットカード登録と配送先情報を入力してください。'
    else
    # クレジットカード情報あり、決済処理に移行
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      # 請求を発行
      Payjp::Charge.create( 
      amount: @post.price,
      customer: @userCard.payjp_id,
      currency: 'jpy',
      )
      # 売り切れなので、postの情報をアップデートして売り切れにする
      if @post.update(sales_status: 0)
        flash[:notice] = '購入しました。'
        redirect_to root_path
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to root_path
      end
    end
  end

end
