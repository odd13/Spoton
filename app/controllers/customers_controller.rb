class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @locations = @customer.locations
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:success] = 'Customer deleted'
    redirect_to customers_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      @customer.save
      redirect_to action: :index
    else
      render 'customers/edit'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :name, :address, :suburb, :state, :postcode, :country, :email, :phone
    )
  end
end
