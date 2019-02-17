require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "My Book Title",
                            description: "yyy",
                          image_url: "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
    assert product.invalid?

  end

  def new_product(image_url)
    Product.new(title: "My Book Title",
                description: "yyy",
                price: 1,
                image_url: "zzz.jpg")
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.JPG
            http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.doc fred.gif/more fred.gif.more}

    ok.each do |image_url|
      assert new_product(image_url).valid?,
      "#{image_url} shouldn't be invalid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?,
      "#{image_url} shouldn't be valid"
    end

  end

  fixtures :products
  #...

  test "product is not valid without a unique title" do
    product = Product.new(title: product (:ruby).title,
                description: "yyy",
                price: 1,
                image_url: "fred.gif")

    assert product.invalid?
    assert_equal ["has already been taken"],
    product.errors[:title]

  end

  test "product is not valid without a unique - i18n" do
    product = Product.new(title: product (:ruby).title,
                description: "yyy",
                price: 1,
                image_url: "fred.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
    product.errors[:title]

  end

  def create
    @product = Product.new(product_params)

    responds_to do |format|
      if @product.save
        format.html { redirect_to @product,
        notice: 'Product was successfully created.'}
        format.json { render :show, status: :created,
        location: @product}
      else
        puts @product.errors.full_messages
        format.html { render :new}
        format.json { render json: @product.errors,
        status: :unprocessable_entity}
      end
    end
  end

  

end
