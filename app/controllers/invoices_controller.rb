class InvoicesController < ApplicationController
  def index
    @invoices = invoice.all
  end

  def new
    @invoice = invoice.new
  end

  def create
    @invoice = invoice.new(invoice_params)
    if @invoice.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @invoice = invoice.find(params[:id])
  end

  def destroy
    @invoice = invoice.find(params[:id])
    @invoice.destroy
    flash[:success] = 'invoice deleted'
    redirect_to '/invoices'
  end

  def edit
    @invoice = invoice.find(params[:id])
  end

  def update
    @invoice = invoice.find(params[:id])
    if @invoice.update(invoice_params)
      @invoice.save
      redirect_to action: :index
    else
      render 'invoices/edit'
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:work_type, :cust_name,
                                    :cust_address, :price, :taxi,
                                    :parent_id)
  end
end
