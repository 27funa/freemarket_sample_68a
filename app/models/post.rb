class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area

  belongs_to :user
  belongs_to :category,optional: true

  has_many :images

  accepts_nested_attributes_for :images, allow_destroy: true
  
  

  # validates :item_name, presence: { message: "を入力してください"}
  # validates :description, presence: { message: "を入力してください"}
  # validates :sales_status, presence: true
  # validates :brand, presence: true
  # validates :condition, presence: true
  # validates :shipping_area, presence: true
  # validates :arrival_days, presence: true
  # validates :postage_payment, presence: true
  # validates :image_taken, presence: { message: "画像をありません。"}

  # validates_associated :images
  # validates :

  validate :add_error_sample
  validates :price,:numericality => {
    :greater_than_or_equal_to => 300,
    :less_than_or_equal_to => 9999999,
    :message => '入力値が300~9999999の範囲外です' 
 }
  # validates :category,presence:{message: "かてごりー"}

  def add_error_sample
    if image_taken.blank?
      errors[:image_taken] << "画像がありません。"
    end
    # nameが空のときにエラーメッセージを追加する
    if item_name.blank?
      errors[:item_name] << "商品名を入力してください"
    end
 
    # 価格が空のときにエラーメッセージを追加する
    if description.blank?
      errors[:description] << "詳細を入力してください"
    end

    if category.blank?
      errors[:category] << "カテゴリーを入力してください"
    end

    if condition.blank?
      errors[:condition] << "商品の状態を選択してください"
    end

    if postage_payment.blank?
      errors[:postage_payment] << "配達料の負担を選択してください"
    end

    if shipping_area_id.blank?
      errors[:shipping_area_id] << "配達エリアを選択してください"
    end

    if arrival_days.blank?
      errors[:arrival_days] << "発送までの日数を入力してください"
    end
  end



  
end
