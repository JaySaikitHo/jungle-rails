require 'rails_helper'

RSpec.describe Product, type: :model do
 
  describe 'Validations' do
    it 'should save successfully' do
      @product = Product.new
      @product.name = 'Crap'
      @product.price = 10
      @product.quantity = 3
      @category = Category.new name: 'Furniture'
      @product.category = @category 
      @product.save
      
      expect(@product).to be_valid
    end

    it 'should have an error for the name' do
      @product = Product.new
      @product.name = nil
      @product.price = 10
      @product.quantity = 3
      @category = Category.new name: 'Furniture'
      @product.category = @category 
      @product.save
      
      expect(@product.errors.full_messages).to include("Name can't be blank")
      
    end
  
    it 'should have an error for the price' do
      @product = Product.new
      @product.name = 'Stuff'
      @product.price = nil
      @product.quantity = 3
      @category = Category.new name: 'Furniture'
      @product.category = @category 
      @product.save
      
      expect(@product.errors.full_messages).to include("Price can't be blank")
      
    end
    
    it 'should have an error for the quantity' do
      @product = Product.new
      @product.name = 'Stuff'
      @product.price = 10
      @product.quantity = nil
      @category = Category.new name: 'Furniture'
      @product.category = @category 

      @product.save
      
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      
    end
        
    it 'should have an error for the category' do
      @product = Product.new
      @product.name = 'Stuff'
      @product.price = 10
      @product.quantity = 3
      @product.category_id = nil 

      @product.save
      
      expect(@product.errors.full_messages).to include("Category can't be blank")
      
    end
  
  end
  
  
    
  

end
