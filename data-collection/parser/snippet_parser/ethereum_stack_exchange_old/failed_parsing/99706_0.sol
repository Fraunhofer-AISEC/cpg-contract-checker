pragma solidity 0.5.17;

contract Bet {

uint256 public betSum;
address payable public owner;

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}

constructor() public {
    owner = msg.sender;     
}



function checkSum() public view returns (uint256) {
    return betSum;
}


function withdrawEther(uint256 amount) external payable onlyOwner {
require(address(this).balance>=amount, 'Error, contract has 
 insufficent balance');
owner.transfer(amount);

}
}
