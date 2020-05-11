# Preview all emails at http://localhost:3000/rails/mailers/relationship_mailer
class RelationshipMailerPreview < ActionMailer::Preview
  def request_creating
    user = User.first
    request = user.request.new
    RelationshipMailer.request_creating(user, request)
  end
end
