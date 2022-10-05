
function makeBook(Book calldata book) external {
    newBook = Book(book.title, book.pages);
}


function makeBook(string title, uint256 pages) external {
    newBook = Book(title, pages);
}
