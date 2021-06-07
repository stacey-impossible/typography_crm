class AdminController < ApplicationController
  before_action :admin?

  def admin?
    redirect_to '/' if current_user&.type != 'Admin'
  end
end
