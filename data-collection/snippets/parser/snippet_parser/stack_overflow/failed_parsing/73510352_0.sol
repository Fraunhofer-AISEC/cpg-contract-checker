

    pragma solidity ^0.8.7;
    
    contract freeLottery {
        address public owner;
        uint public lotteryId;
        mapping (uint => address payable) public lotteryHistory;
        
       struct Players {
            bool isWinner;
            uint id;
        }
    
        mapping (address => Players) players;
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
            players[msg.sender];
            playersCount++;    
        }               
    
        
    
        function contribute() public payable onlyowner{
            require(msg.value>0,"Please send an amount greater than 0");
        }       
    
        function getRandomNumber() internal view returns (uint) {
            return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
        }
    
        function pickWinner() public onlyowner {
            require(address(this).balance>0,"Please upload balance");
            uint index = getRandomNumber() % ???;
            ???
    
            ???
    
            lotteryHistory[lotteryId] = players[id];
            lotteryId++;
    
            
            ???;
        }
    
        modifier onlyowner() {
          require(msg.sender == owner);
          _;
        }
    }   
