pragma solidity ^0.4.20;

contract A {
    
    address private owner_;
    
    function A() public {
        owner_ = msg.sender;   
    }
    
    function getOwner() public view returns (address) {
        return owner_;
    }
}

contract B {
    
    function findAsOwner() public view returns (bool) {
        require(A(address of contract A).getOwner() == msg.sender);
        return true;
    }
}
