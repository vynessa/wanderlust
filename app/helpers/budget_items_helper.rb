module BudgetItemsHelper
  def budget_cost
    @budget_items.sum(:cost)
  end
end
