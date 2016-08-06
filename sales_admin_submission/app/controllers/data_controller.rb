class DataController < ApplicationController

  def index
  end

  def create
    filepath = csv_params.path
    CSV.foreach(filepath, headers: true, header_converters: :symbol) do |row|
      OpenStruct.new(row.to_h)
    end
    redirect_to root_path
  end

  private

    def csv_params
      params.require('file')
    end
end
