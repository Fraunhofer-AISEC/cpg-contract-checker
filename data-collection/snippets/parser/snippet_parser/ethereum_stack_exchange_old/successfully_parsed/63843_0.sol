pragma solidity ^0.4.24;

contract SimpleContract {


function () public payable  {
}

constructor() payable  public {
}

function paybackEther() public  {
    selfdestruct(msg.sender);
}

}
