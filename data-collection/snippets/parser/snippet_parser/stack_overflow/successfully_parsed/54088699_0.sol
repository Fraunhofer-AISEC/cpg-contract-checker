pragma solidity ^0.4.24;

contract TestContract {        
    function payAddress(address _address) external payable {
         _address.transfer(msg.value);
    }
}
