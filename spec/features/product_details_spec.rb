require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99

      )
    end
  
  end
  scenario "They can access the details by clicking on the details button" do
    # ACT
    visit root_path
    # find the details button and click it
    first('article.product').find_link('Details').click
    # find the details <dt>
    # DEBUG / VERIFY
    expect(page).to have_css '.products-show'
    save_screenshot
  end


  
end
