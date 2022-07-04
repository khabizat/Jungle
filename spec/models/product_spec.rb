require 'rails_helper'

#should be present to pass validation
#name
#price
#quantity
#category

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid when all attributes are present' do
      @category = Category.new
      @product = Product.new
      
      @product.name='Fern'
      @product.price_cents=5000
      @product.quantity = 10
      @product.category = @category

      @product.save
      expect(@product).to be_valid
    end

    it 'is not valid when name is not present' do
      @category = Category.new
      @product = Product.new
      
      @product.name=nil
      @product.price_cents=5000
      @product.quantity = 10
      @product.category = @category

      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end


    it 'is not valid when price is not present' do
      @category = Category.new
      @product = Product.new
      
      @product.price_cents=nil
      @product.name='Fern'
      @product.quantity = 10
      @product.category = @category

      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end

    it 'is not valid when quantity is not present' do
      @category = Category.new
      @product = Product.new
      
      @product.quantity = nil
      @product.name='Fern'
      @product.price_cents=5000
      @product.category = @category


      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    it 'is not valid when category is not present' do
      @category = Category.new
      @product = Product.new
      
      @product.category = nil
      @product.name='Fern'
      @product.price_cents=5000
      @product.quantity = 10

      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ["Category must exist", "Category can't be blank"]
    end

  end
end