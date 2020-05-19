class RequestMailer < ApplicationMailer
  
  def send_buyer(requested)
    @request = requested
    mail(
      from: 'crazy.max.meteora@gmail.com',
      to: requested.email,
      subject: '購入ありがとうございます。'
      )
  end
end
