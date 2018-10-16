# require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

require 'rails_helper'

RSpec.feature "Product Details", type: :feature, js: true do
 # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

    scenario "User can navigate from home page to product detials page" do


    visit '/'
    first('article.product').first('a').click
    product_name = first('article.product').find('h4').text
    expect(page).to have_css('.products-show')
    save_screenshot


  end
end