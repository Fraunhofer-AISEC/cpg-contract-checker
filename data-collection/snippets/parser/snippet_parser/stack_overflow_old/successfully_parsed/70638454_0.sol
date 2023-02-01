struct Book {
    string info1;
    string info2;
}

mapping(string => Book) public books;


function registerBook(string memory info1, string memory info2, string memory key) public returns (bool success) {

    Book memory newBook;
    newBook.info1 = info1;
    newBook.info2 = info2;
    books[key] = newBook;

    return true;
}
