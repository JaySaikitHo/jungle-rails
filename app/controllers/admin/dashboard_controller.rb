class Admin::DashboardController < ApplicationController
  
  def show
  @product_total = Product.sum("quantity")
  
  @product_categories = Category.select("id").uniq.length
  # raise @product_categories.inspect
  end
end
