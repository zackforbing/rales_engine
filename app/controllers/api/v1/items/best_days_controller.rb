class BestDaysController < Application
  def show
    item = Item.find(params[:id]).best_day
    respond_with item
  end
end
