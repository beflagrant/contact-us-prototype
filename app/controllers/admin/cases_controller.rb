class Admin::CasesController < AdminController
  before_action :set_admin_case, only: [:show, :edit, :update, :destroy]

  # GET /admin/cases
  # GET /admin/cases.json
  def index
    @admin_cases = Admin::Case.where.not(aasm_state: 'closed')
  end

  def show
    @admin_case.review! if @admin_case.open?
  end

  def destroy
    @admin_case.close!
    respond_to do |format|
      format.html { redirect_to admin_cases_url, notice: 'Case closed!' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_case
    @admin_case = Admin::Case.find(params[:id])
  end

  def admin_case_params
    params.fetch(:admin_case, {})
  end
end
