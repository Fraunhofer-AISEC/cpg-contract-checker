contract A {
  mapping(address => uint8[10]) public gameBoards;
}


function testGetGameBoard() {
  address myAddress;
  uint8[10] memory gameBoard = a.boards(address);
  Assert.equal(gameBoard[0], 0, 'uint8 arrays are initialized with 0');
  
}