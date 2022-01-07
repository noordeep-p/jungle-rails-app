require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it "tests validate" do 
      @product = Product.new
      @category = Category.new
      @category.name = "Testing"
      @product.name = "Testing"
      @product.price_cents = 55555
      @product.quantity = 5
      @product.category = @category

      expect(@product.valid?).to be true
    end

    it "tests for name being entered" do
      # invalid entry
      @product = Product.new
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")
      # valid entry
      @product.name = 'Testing'
      @product.valid? 
      expect(@product.errors[:name]).not_to  include("can't be blank")
    end

    it "price in cents to be entered" do
      # invalid entry
      @product = Product.new
      @product.price_cents = nil 
      @product.valid?
      expect(@product.errors[:price_cents]).to  include("is not a number")
      # valid entry
      @product.price_cents = 55555 
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to  include("can't be blank")
    end
  
    it "quantity to be entered" do
      # invalid entry
      @product = Product.new
      @product.quantity = nil 
      @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")
      # valid entry
      @product.quantity = 5 
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end
  
    it "to have a category id" do
      # invalid entry
      @category = Category.new
      @product = Product.new
      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")
      # valid entry
      @product.category = @category
      @product.valid?
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end
  end
end