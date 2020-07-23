class Admin::CaseMessageMailer < ApplicationMailer
  def message_email
    @kase = params[:kase]
    @message = params[:message]
    @message.body.body.attachables.each do |blob|
      attachments[blob.filename.to_s] = {
        mime_type: blob.content_type,
        content: blob.download
      }
    end
    mail(
      to: @kase.intake.email,
      from: "#{@kase.token}@example.com",
      body: @message.body.to_s,
      content_type: "text/html",
    )
  end
end
