class PurchaseMailer < ApplicationMailer
  
  def send_buyer(purchase)
    @purchase = purchase
    mail(
      from: 'crazy.max.meteora@gmail.com',
      to: purchase.email,
      subject: '購入ありがとうございます。'
      )
  end
end