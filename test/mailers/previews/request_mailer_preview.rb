# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def inquiry
    requested = Request.new(name: "侍 太郎")
    
    RequestMailer.send_buyer(requested)
  end
end
