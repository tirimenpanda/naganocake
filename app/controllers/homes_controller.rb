class HomesController < ApplicationController

 def top
 end

 def about
     today = DateTime.today
     @orders = Order.where(created_at: today)
 end

end
