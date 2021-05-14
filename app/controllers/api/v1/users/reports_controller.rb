class Api::V1::Users::ReportsController < ApiController
  def index
    user = User.find_by(id: params[:id])
    @reports = user.reports.all
  end

  def create
  end

  def destroy
  end
end