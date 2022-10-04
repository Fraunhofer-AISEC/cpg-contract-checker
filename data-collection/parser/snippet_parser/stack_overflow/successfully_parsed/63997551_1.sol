








pragma solidity ^0.7.0;

contract AutoLottery {
    address[] public players;
    uint256 public totalPayoutValue;
    uint256 public currentPrizePool;
    address public lastWinner;
    uint256 public lastPayout;
    address public owner;

    constructor() {
        totalPayoutValue = 0 ether;
        currentPrizePool = 0 ether;
        lastPayout = 0 ether;
        owner = msg.sender;
    }
    
    
    function enter() public payable {
        require(msg.value >= 0.01 ether, "You must enter 0.01 or more Ether!");
        players.push(msg.sender);
        currentPrizePool += msg.value;
        if (address(this).balance >= 1.00 ether) {
            winner();
        }
    }

    
    function winner() internal {
        require(address(this).balance >= 1.00 ether, "Not enough eth in prize pool!");

        uint index = random() % players.length;
        
        totalPayoutValue += address(this).balance;
        lastWinner = players[index];
        lastPayout = address(this).balance;
        
        payable(players[index]).transfer(address(this).balance);
        
        delete players;
    }

    
    function random() private view returns (uint) {
        return uint(keccak256(abi.encode(block.difficulty, block.timestamp, players)));
    }

    
    function getPlayers() public view returns (address[] memory) {
        return players;
    }
    
    
    function emergencyDraw() public {
        require(msg.sender == owner, "Only the owner can call this method!");
        
        uint index = random() % players.length;
        
        totalPayoutValue += address(this).balance;
        lastWinner = players[index];
        lastPayout = address(this).balance;
        
        payable(players[index]).transfer(address(this).balance);
        
        delete players;
    }

}
