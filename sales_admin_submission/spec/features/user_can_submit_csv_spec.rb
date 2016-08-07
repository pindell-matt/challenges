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

    expect(page).to have_current_path(root_path)

    expect(Customer.count).to eq(4)
    expect(Merchant.count).to eq(4)
    expect(Item.count).to eq(4)
    expect(Order.count).to eq(5)
    expect(OrderItem.count).to eq(5)

    within('.results') do
      expect(page).to have_text('Total Revenue for all Merchants: 526.45')
      expect(page).to have_text('Carpenter Outfitters: 149.99')
      expect(page).to have_text('Hero Outlet: 47.5')
      expect(page).to have_text('Stockholm Supplies: 199.96')
      expect(page).to have_text('Parker Footwear: 129.0')
    end
  end
end
