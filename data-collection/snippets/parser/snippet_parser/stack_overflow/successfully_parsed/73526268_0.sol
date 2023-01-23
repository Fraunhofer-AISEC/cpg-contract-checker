

pragma solidity ^0.8.7;

contract freeLottery {
    address public owner;
    
    uint public lotteryId;
    mapping (uint => address payable) public lotteryHistory;
   
    
    mapping (uint => address) players;
    uint playersCount=0;
    
    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    function getWinner(uint lottery) public view returns (address payable) {
        return lotteryHistory[lottery];
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    
    
    

    function enter() public payable {    
        
        playersCount++;
        
        players[playersCount]=payable(msg.sender);       
    }            

    function contribute() public payable onlyowner{
        require(msg.value>0,"Please send an amount greater than 0");
    }       

    function getRandomNumber() internal view returns (uint) {
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    function pickWinner() public onlyowner returns (address payable) {
        require(address(this).balance>0,"Please upload balance");
        uint index = getRandomNumber() % playersCount;
        address payable winner=payable(players[index]);
        payable(players[index]).transfer(address(this).balance);
            
        lotteryHistory[lotteryId] = winner;
        
        lotteryId++;
    
        
        for (uint i=0; i< playersCount ; i++) {
            delete players[i];
        }     
        return winner   ;   
    }

    modifier onlyowner() {
      require(msg.sender == owner);
      _;
    }
}
