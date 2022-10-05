abstract contract AionClient is Aion, Context, Ownable{
using SafeMath for uint256;
using Address for address;
address private AionAddress;
constructor(address addraion) public{
    AionAddress = addraion;
}





function execfunct(address to, uint256 value,uint256 gaslimit,bytes memory gas, bytes memory 
data) internal virtual returns (bool) {
    require(msg.sender == AionAddress);
    return to.call{value:value}("").gas(gaslimit)(data);
}


receive () external payable {}

}
