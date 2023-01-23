pragma solidity 0.4.24;

contract Test {

    struct Book {
        uint id;
    }

    Book[] books;

    uint public status;

    constructor() public {
        books.push(Book(10));
    }

    function changeStatus1() external {
        Book storage book = books[0];
        if (book.id == 10) {
            status = 1;
        }
    }

    function changeStatus2() external {
        Book memory book = books[0];
        if (book.id == 10) {
            status = 2;
        }
    }
}
