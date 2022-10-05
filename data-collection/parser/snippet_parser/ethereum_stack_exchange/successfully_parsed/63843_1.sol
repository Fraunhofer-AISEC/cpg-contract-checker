pragma solidity ^0.4.24;

contract SimpleContract {

bool public finished;

function () public payable  {
}

constructor() payable  public {
}

function paybackEther(bool newfinished) public  {

finished = newfinished;        
selfdestruct(msg.sender);
}

}
