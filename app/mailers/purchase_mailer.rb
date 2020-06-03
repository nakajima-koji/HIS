class PurchaseMailer < ApplicationMailer
  
  def send_buyer(purchase)
    @purchase = purchase
    mail(
      from: 'crazy.max.meteora@gmail.com',
      to: @purchase.email,
      subject: '購入ありがとうございます。'
      )
  end
  
  def send_admin(purchase)
    @purchase = purchase
    mail(
      from: 'crazy.max.meteora@gmail.com',
      to: 'crazy.max.meteora@gmail.com',
      subject: '購入されました。')
  end
end