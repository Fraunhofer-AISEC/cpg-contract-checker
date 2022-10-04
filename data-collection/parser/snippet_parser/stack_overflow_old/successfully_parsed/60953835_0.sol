pragma solidity >=0.4.21 <0.7.0;

contract MyContract {
function payEther(address payable _wallet, uint _amount) public {
     _wallet.transfer(_amount);
}
}
