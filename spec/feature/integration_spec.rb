require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in "book[author]", with: 'harry potter'
        fill_in "book[price]", with: '18.99'
        select '2020', from: 'book_published_date_1i'
        select 'January', from: 'book_published_date_2i'
        select '12', from: 'book_published_date_3i'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('harry potter')
        expect(page).to have_content('18.99')
        expect(page).to have_content('2020-01-12')
    end
    scenario 'blank title inputs' do
        visit new_book_path
        fill_in "book[title]", with: ''
        click_on 'Create Book'
        expect(page).to have_content('Title can\'t be blank')
    end
    scenario 'no author' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in "book[author]", with: ''
        click_on 'Create Book'
        expect(page).to have_content('Author can\'t be blank')
    end
    scenario 'no price' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in "book[price]", with: ''
        click_on 'Create Book'
        expect(page).to have_content('Price can\'t be blank')
    end
    scenario 'no date' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        select '', from: 'book_published_date_1i'
        select '', from: 'book_published_date_2i'
        select '', from: 'book_published_date_3i'
        click_on 'Create Book'
        expect(page).to have_content('Published date can\'t be blank')
    end
end