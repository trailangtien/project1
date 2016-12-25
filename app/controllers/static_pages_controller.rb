class StaticPagesController < ApplicationController
  def index
    @top_new_products = Product.top_new_products.take(Settings.default.top_new_products)
    @top_order_products = Product.top_order_products.take(Settings.default.top_order_products)
    if is_logged_in?
      @recently_products = Product.of_ids RecentlyViewed.product_ids_by_user(current_user.id)
    end
  end
end
