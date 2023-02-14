bytes32 constant BOOK_TYPEHASH = keccak256(
        "Book(Record[] records,address bookmaker,uint256 salt)"
    );

function hashBook(Book calldata book) external pure returns (bytes32) {
    return keccak256(abi.encode(
        BOOK_TYPEHASH,
        book.records,
        book.bookmaker,
        book.salt
    ));
}
