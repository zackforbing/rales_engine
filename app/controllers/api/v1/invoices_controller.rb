class Api::V1::InvoicesController < Api::V1::BaseController
  
  def index
    @invoices = Invoice.all.to_json
    render json: @invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
    render json: @invoice
  end
end
