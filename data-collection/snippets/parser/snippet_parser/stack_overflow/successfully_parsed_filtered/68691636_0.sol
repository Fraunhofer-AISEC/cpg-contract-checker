pragma solidity ^0.5.0;

contract LuckyDraw 
{
    address owner;
    address[3] participants;
    
    constructor() public 
    {  
        owner =  msg.sender;
    }

    modifier onlyOwner()
    {
        require(msg.sender == owner);
        _;
    }
    
    modifier notOwner()
    {
        _;
    }
    
    function joinLottery() payable public require notOwner()
    {
        require(msg.value == 2 ether);
    }
    
    function random() private view returns(uint)
    {
        return uint(keccak256(abi.encode(block.difficulty, now, participants)));
    }
    
    function pickwinner() external onlyOwner 
    {
        uint win = random() % participants.length;
        
        participants[index].transfer(address(this).balance);
        
        participants = new address[](0);
    }
}

