######## MY UNIT TESTS #########

require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    book = Book.new(title: "Example Book")
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end
end

######## MY INTEGRATION TESTS ########

RSpec.describe "Book management", type: :feature do
    scenario "user successfully adds a new book" do
      visit new_book_path
      fill_in "Title", with: "Test Book"
      click_button "Create Book"
  
      expect(page).to have_content("Book was successfully created.")
      expect(Book.last.title).to eq("Test Book")
    end
  
    scenario "user is unable to add a new book without a title" do
      visit new_book_path
      fill_in "Title", with: ""
      click_button "Create Book"
  
      expect(page).to have_content("Title can't be blank")
    end
  end