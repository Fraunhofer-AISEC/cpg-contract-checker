
pragma solidity ^0.8.17;

contract Enums {

    struct User {
        Book book;
    }

    enum Book {
        Book1,
        Book2,
        Book3
    }

    mapping(address => User) public students;

    function setStudentBook(Book _book) external {
        students[msg.sender].book = _book;
    }

    function getStudentBook() external view returns (string memory) {
        uint8 book = uint8(students[msg.sender].book);
        if (book == 0) {
            return "Book1";
        } else if (book == 1) {
            return "Book2";
        }
        return "Book3";
    }

}
