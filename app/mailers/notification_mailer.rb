class NotificationMailer < ApplicationMailer
  default from: 'no-reply@foodster.com'

  def comment_added(comment)
    @place = comment.place
    @commenter = comment.user.username
    @place_owner = @place.user
    mail(
      to: @place_owner.email,
      subject: "A comment has been added to #{@place.name}"
    )
  end
end
