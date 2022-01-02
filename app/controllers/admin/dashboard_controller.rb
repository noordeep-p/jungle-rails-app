class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def show
    @total_products = Product.count
    @total_categories = Product.group(:category_id).count
  end

end
