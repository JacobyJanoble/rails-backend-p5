class ContactMailer < ApplicationMailer
    default from: 'jacobymccann@gmail.com'

    CONTACT_EMAIL = 'jacobmccann1112@gmail.com'

    def submission(message)
        @message = message
        mail(to: CONTACT_EMAIL, subject: 'New contact page submission')
    end
end
