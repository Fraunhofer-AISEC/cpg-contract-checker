struct Bid {
    address bidder;
    uint amount; 
    bool home; 
    int64 line;
}

event BidPlaced(bytes32 indexed game_id, BookType book, address bidder, uint amount, bool home, int64 line);

function test(bytes32 game_id, bool home, int64 line) payable returns (int) {
    Game game = getGameById(game_id);
    Book book = game.books[uint(BookType.Spread)];
    Bid memory bid = Bid(msg.sender, msg.value, home, line);

    
    book.homeBids.push(bid);

    BidPlaced(game_id, BookType.Spread, msg.sender, msg.value, home, line);
    return 0;
}
