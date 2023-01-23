pragma solidity ^0.8.4

contract Bet {
    
    address payable owner;

    AggregatorV3Interface internal priceFeed;

    
    enum BetStatus { LONG, SHORT, NGMI }

    
    struct Game {
      uint256 betPrice;
      uint256 betAmount;
      BetStatus status;
      address maker;
      address taker;
      string deadline;
    }

    mapping (bytes32 => Game) public games;
    Game[] public activeGames;

    modifier onlyOwner() {
      require(msg.sender == owner);
      _;
    }

    receive() external payable {
    }

     
    constructor() public payable {
      priceFeed = AggregatorV3Interface(address(0x9326BFA02ADD2366b30bacB125260Af641031331));
    }

    function getThePrice() public view returns (int) {
      (
        uint80 roundID,
        int price,
        uint startedAt,
        uint timeStamp,
        uint80 answeredInRound
      ) = priceFeed.latestRoundData();

      return price;
    }

    function makeBet(uint _guess, string memory deadline) public payable {
      Game(msg.value, _guess, BetStatus(0), msg.sender, address(0), deadline);
      uint current_price = uint(getThePrice());

      if (_guess > current_price) {
        Game.status = BetStatus.LONG;
      } else if (_guess < current_price) {
        Game.status = BetStatus.SHORT;
      } else {
        Game.status = BetStatus.NGMI;
      }
}

function takeBet() public payable {
      
      
      require(msg.value == Games.betAmount);
      Game.taker = msg.sender;
    }

    function getBetOutcome() public payable {
      

      uint current_price = uint(getThePrice());
      if (Game.status == BetStatus.LONG && current_price >= Game.betPrice) {
        (bool sent, bytes memory data) = Game.maker.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
      } else if (Game.status == BetStatus.SHORT && current_price <= Game.betPrice) {
        (bool sent, bytes memory data) = Game.maker.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
      } else {
        (bool sent, bytes memory data) = Game.taker.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
      }
    }

}