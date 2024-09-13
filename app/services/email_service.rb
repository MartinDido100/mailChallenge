class EmailService

  def createMail(sendMailParams,loggedUser)
    sendMailParams[:senderId] = loggedUser.id
    Email.create!(sendMailParams)
  end

  def getStats
    @users = User.joins(:emails_sent)
    .select('users.*, COUNT(emails.id) AS emailsCount')
    .where('emails.created_at >= ?', Date.today.beginning_of_day)
    .where('emails.created_at <= ?', Date.today.end_of_day)
    .group('users.id')
    .having('COUNT(emails.id) > 0')
    .order('emailsCount DESC')

    @users
  end

end