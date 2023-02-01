pragma solidity ^0.4.0;

contract myContract
{



struct Bets{
    uint betNum; 
}

mapping(address => Bets[]) myBetMapping;

function addBet(uint n) returns(uint)
{
    Bets memory l;
    l.betNum = n;
    myBetMapping[msg.sender].push(l);

   

   return myBetMapping[msg.sender][myBetMapping[msg.sender].length -1].betNum;

}



function modifyBet(uint n, uint index) returns(uint,uint,uint)
{
    
    
    
}
}


