RSpec.describe Book do
  it 'attributes' do
    book = Book.new(title: 'sup')
    expect(book.title).to be == 'sup'
  end
end
