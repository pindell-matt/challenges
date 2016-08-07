require 'rails_helper'

feature "User can submit csv" do
  before :each do
    @filepath = Rails.root.join('..', 'sales_admin', 'salesdata.csv')
  end

  scenario "with valid data" do
    visit root_path

    within('.csv-form') do
      attach_file :file, @filepath
      click_button 'Import CSV'
    end

    expect(Customer.count).to eq(4)
    expect(Merchant.count).to eq(4)
    expect(Item.count).to eq(4)
  end
end
