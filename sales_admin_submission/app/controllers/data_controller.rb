class DataController < ApplicationController

  def index
    @merchants = Merchant.all
    @total = Merchant.total_sales_revenue
  end

  def create
    unless csv_params.empty?
      csv_parser(csv_params[:file].path)
    else
      flash[:notice] = "Please submit a file!"
    end
    redirect_to root_path
  end

  private

    def csv_params
      params.permit('file')
    end

    def csv_parser(filepath)
      CsvParser.new(filepath)
    end
end
