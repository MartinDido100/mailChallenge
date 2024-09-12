class EmailService

  def createMail(sendMailParams,loggedUser)
    sendMailParams[:senderId] = loggedUser.id
    Email.create!(sendMailParams)
  end

end