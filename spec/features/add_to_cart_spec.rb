require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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
  
  scenario "The 'My Cart' changes from 0 to 1" do
    # ACT
    visit root_path
    #find add to cart, click on cart
    first('article.product').find_button('Add').click
    
    # DEBUG / VERIFY
    expect(page).to have_text 'My Cart (1)'
    
    save_screenshot
  end

end