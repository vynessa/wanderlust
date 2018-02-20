class BudgetItemsController < ApplicationController
  before_action :set_budget_item, only: [:edit, :update, :destroy]
  before_action :set_trip
  before_action :authenticate_user!

  # GET /budget_items
  def index; end

  # GET /budget_items/new
  def new
    @budget_item = BudgetItem.new
  end

  # GET /budget_items/:id/edit
  def edit; end

  # POST /budget_items
  def create
    @budget_item = @trip.budget_items.new(budget_item_params)

    respond_to do |format|
      if @budget_item.save
        format.html {
          redirect_to @trip,
          notice: 'Budget item was successfully created.'
        }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /budget_items/:id
  def update
    respond_to do |format|
      if @budget_item.update(budget_item_params)
        format.html {
          redirect_to @trip,
          notice: 'Budget item was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /budget_items/:id
  def destroy
    @budget_item.destroy
    respond_to do |format|
      format.html {
        redirect_to @trip,
        notice: 'Budget item was successfully destroyed.'
      }
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_budget_item
      @budget_item = BudgetItem.find(params[:id])
    end

    def budget_item_params
      params.require(:budget_item).permit(
        :item, :description, :cost, :trip_id
      )
    end
end
