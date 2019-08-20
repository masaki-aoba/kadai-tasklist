class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def ensure_correct_user
    @task = Task.find_by(id:params[:id])
    if @task.nil?
      flash[:notice] = "指定された番号に該当するタスクがありません。"
      redirect_to root_url
    elsif @task.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_url
    end
  end
end
