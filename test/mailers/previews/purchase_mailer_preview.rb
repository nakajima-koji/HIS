# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class PurchaseMailerPreview < ActionMailer::Preview
  def inquiry
    requested = Purchase.new(name: "侍 太郎")
    
    PurchaseMailer.send_buyer(requested)
  end
end
