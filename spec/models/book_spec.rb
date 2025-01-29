######## MY UNIT TESTS #########

require 'rails_helper'

RSpec.describe Book, type: :model do
    # title
    it "is valid with a title" do
        book = Book.new(
            title: "Example Book",
            author: "First Last",
            price: 79.10,
            publish_date: Date.today
        )
        expect(book.title).to eq('Example Book')
    end

    it "is invalid without a title" do
        book = Book.new(
            title: nil,
            author: "First Last",
            price: 79.10,
            publish_date: Date.today    
        )
        expect(book).not_to be_valid
    end

    # author
    it "is valid with an author" do
        book = Book.new(
            title: "Example Book",
            author: "First Last",
            price: 79.10,
            publish_date: Date.today
        )
        expect(book.author).to eq('First Last')
    end

    it "is invalid without an author" do
        book = Book.new(
            title: "Example Book",
            author: nil,
            price: 79.10,
            publish_date: Date.today    
        )
        expect(book).not_to be_valid
    end

    # price
    it "is valid with a price" do
        book = Book.new(
            title: "Example Book",
            author: "First Last",
            price: 79.10,
            publish_date: Date.today
        )
        expect(book.price).to eq(79.10)
    end

    it "is invalid without a price" do
        book = Book.new(
            title: "Example Book",
            author: 'First Last',
            price: nil,
            publish_date: Date.today    
        )
        expect(book).not_to be_valid
    end

    # publish_date

    it "is valid with a publish date" do
        book = Book.new(
            title: "Example Book",
            author: "First Last",
            price: 79.10,
            publish_date: Date.today
        )
        expect(book.publish_date).to eq(Date.today)
    end

    it "is invalid without a publish date" do
        book = Book.new(
            title: "Example Book",
            author: "First Last",
            price: 79.10,
            publish_date: nil   
        )
        expect(book).not_to be_valid
    end
end

######## MY INTEGRATION TESTS ########

RSpec.describe "Manage Book Info", type: :feature do
    scenario "user correctly adds books with all attributes" do
        visit new_book_path
        fill_in "Title", with: "Book"
        fill_in "Author", with: "Author"
        fill_in "Price", with: 179.10
        select Date.today.year, from: "book_publish_date_1i"
        select Date.today.strftime("%B"), from: "book_publish_date_2i"
        select Date.today.day, from: "book_publish_date_3i"
        click_button "Create Book"
    
        expect(page).to have_content("Book was successfully created.")
        book = Book.last
        expect(book.title).to eq("Book")
        expect(book.author).to eq("Author")
        expect(book.price).to eq(179.10)
        expect(book.publish_date).to eq(Date.today)
      end
  
    scenario "prevent the user from adding a new book without a title" do
      visit new_book_path
      fill_in "Title", with: ""
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: 79.10
      select Date.today.year, from: "book_publish_date_1i"
      select Date.today.strftime("%B"), from: "book_publish_date_2i"
      select Date.today.day, from: "book_publish_date_3i"
      click_button "Create Book"
  
      expect(page).to have_content("Title can't be blank")
    end
  
    scenario "user is unable to add a new book without an author" do
      visit new_book_path
      fill_in "Title", with: "Test Book"
      fill_in "Author", with: ""
      fill_in "Price", with: 79.10
      select Date.today.year, from: "book_publish_date_1i"
      select Date.today.strftime("%B"), from: "book_publish_date_2i"
      select Date.today.day, from: "book_publish_date_3i"
      click_button "Create Book"
  
      expect(page).to have_content("Author can't be blank")
    end
  
    scenario "user is unable to add a new book without a price" do
      visit new_book_path
      fill_in "Title", with: "Book"
      fill_in "Author", with: "Author"
      fill_in "Price", with: ""
      select Date.today.year, from: "book_publish_date_1i"
      select Date.today.strftime("%B"), from: "book_publish_date_2i"
      select Date.today.day, from: "book_publish_date_3i"
      click_button "Create Book"
  
      expect(page).to have_content("Price can't be blank")
    end
  
    scenario "user is unable to add a new book without a publish date" do
      visit new_book_path
      fill_in "Title", with: "Book"
      fill_in "Author", with: "Author"
      fill_in "Price", with: 1.00
      click_button "Create Book"
  
      expect(page).to have_content("Publish date can't be blank")
    end
  end