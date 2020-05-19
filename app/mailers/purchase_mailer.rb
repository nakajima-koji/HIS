class PurchaseMailer < ApplicationMailer
  
  def send_buyer(purchase)
    @purchase = purchase
    mail(
      from: 'crazy.max.meteora@gmail.com',
      to: requested.email,
      subject: '購入ありがとうございます。'
      )
  end
end
