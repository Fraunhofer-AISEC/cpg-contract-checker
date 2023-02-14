

pragma solidity >=0.7.0 <0.9.0;

contract Tranfer { 
    
    event Forward(address to);
    
    address private transferTo = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; 
    address private transferFrom = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; 
    
    receive() external payable {
        if (msg.sender == transferFrom) {
            emit Forward(msg.sender);
            payable(transferTo).transfer(msg.value);
        }
    }
}
