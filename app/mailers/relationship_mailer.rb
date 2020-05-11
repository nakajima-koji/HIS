class RelationshipMailer < ApplicationMailer
  
  def request_creating(user, request)
    @user = user
    @request = request
    mail to: user.email, subject: "T-シャツのリクエストがきました。"
  end

end
