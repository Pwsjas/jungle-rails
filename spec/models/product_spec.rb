require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.find_or_create_by! name: 'Vines'
  end


  describe 'Validations' do

    it "is not valid without a name" do
      @product = Product.create({
      category: @category,
      quantity: 0,
      price: 50.00
    })
      puts @product.errors.full_messages

      expect(@product.errors.full_messages).to_not be_empty
    end

    it "is not valid without a price" do
      @product = Product.create({
      name: 'test',
      category: @category,
      quantity: 0
    })
    puts @product.errors.full_messages

      expect(@product.errors.full_messages).to_not be_empty
    end

    it "is not valid without a quantity" do
      @product = Product.create({
      name: 'test',
      category: @category,
      price: 50
    })
    puts @product.errors.full_messages

      expect(@product.errors.full_messages).to_not be_empty
    end

    it "is not valid without a category" do
      @product = Product.create({
      name: 'test',
      quantity: 0,
      price: 50
    })
    puts @product.errors.full_messages

      expect(@product.errors.full_messages).to_not be_empty
    end

  end

end
