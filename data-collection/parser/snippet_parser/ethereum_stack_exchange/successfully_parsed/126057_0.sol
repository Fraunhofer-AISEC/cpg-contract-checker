pragma solidity ^0.8;

contract Library {

    struct Book {
        uint256 id;
        bytes32 title;
        bytes32 author;
        CoverType cover;
    }

    enum CoverType { HardCover, Paperback }

    uint256 lastBookId;
    mapping(uint256 => Book) books;

    function addBook(bytes32 _title, bytes32 _author, CoverType _cover) public {
        lastBookId++;
        Book memory newBook;
        newBook = Book(lastBookId, _title, _author, _cover);
    }
}
