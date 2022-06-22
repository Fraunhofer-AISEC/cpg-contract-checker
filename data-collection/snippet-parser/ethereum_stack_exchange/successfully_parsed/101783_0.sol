pragma solidity ^0.6.05;
abstract contract AionClient is Aion, Context, Ownable{
using SafeMath for uint256;


address private AionAddress;
constructor(address addraion)  public{
    AionAddress = addraion;
}





function execfunct(address to, uint[] memory value, uint[] memory gaslimit, bytes calldata 
data) external virtual returns (calldata) {
require(msg.sender == AionAddress);
return to.call{value:value}{gas:106000("(gaslimit)(data)")};
}


receive () external payable {}

}
