require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(
            title: 'Harry Potter',
            author: 'J.K. Rowling',
            price: 18.00,
            published_date: '2020-01-12'
        )
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid wihout a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without an author' do
        subject.author = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a price' do
        subject.price = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a numerical price' do
        subject.price = 'blahblah'
        expect(subject).not_to be_valid
    end

    it 'is not valid without a published date' do
        subject.published_date = nil
        expect(subject).not_to be_valid
    end
end