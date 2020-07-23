class Admin::MessagesController < AdminController
  before_action :set_admin_case
  before_action :set_message, only: [:edit, :update]

  def edit; end

  def create
    @admin_message = @admin_case.messages.new(message_params)
    respond_to do |format|
      if @admin_message.save
        if @admin_message.out?
          @admin_case.respond!
          Admin::CaseMessageMailer.with(kase: @admin_case, message: @admin_message)
            .message_email.deliver_later
        end

        format.html { redirect_to @admin_case, notice: 'Message was successfully added.' }
        # format.json { render :show, status: :ok, location: @admin_case }
      else
        format.html { render :edit }
        # format.json { render json: @admin_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # TODO: messages are not editable unless they are internal
    respond_to do |format|
      if @admin_message.update(message_params)
        format.html { redirect_to @admin_case, notice: 'Message was successfully updated.' }
        # format.json { render :show, status: :ok, location: @admin_case }
      else
        format.html { render :edit }
        # format.json { render json: @admin_case.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_admin_case
    @admin_case = Admin::Case.find(params[:case_id])
  end

  def set_message
    @admin_message = Admin::Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:admin_message).permit(:body, :case_id, :direction)
  end
end
