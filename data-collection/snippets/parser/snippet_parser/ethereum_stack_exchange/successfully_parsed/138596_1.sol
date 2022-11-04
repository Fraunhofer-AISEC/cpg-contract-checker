
pragma solidity >=0.7.0 <0.9.0;

contract Board{
  Board[] private boards;
  mapping(address => Board[]) private authorToBoards;

  struct Board{
    string title;
    string description;
  }

  function store(string memory title, string memory description) public {
    Board memory board = Board(title, description);

    boards.push(board);
    authorToBoards[msg.sender].push(board);
  }

  function retrieveAllBoards() public view returns (Board[] memory) {
    return boards;
  }

  function retrieveBoardsByAuthor() public view returns (Board[] memory) {
    return authorToBoards[msg.sender];
  }
}
