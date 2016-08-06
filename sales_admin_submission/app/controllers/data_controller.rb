class DataController < ApplicationController

  def index
  end

  def create
    filepath = csv_params.path
    csv_parser(filepath)
    redirect_to root_path
  end

  private

    def csv_params
      params.require('file')
    end

    def csv_parser(filepath)
      CsvParser.new(filepath)
    end
end
