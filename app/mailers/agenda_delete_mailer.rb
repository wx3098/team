class AgendaDeleteMailer < ApplicationMailer
    def agenda_delete_mail(emails)
    
        @user = emails
        mail to: @user, subject: "アジェンダと紐づく記事とコメント削除メール"
    end
end
