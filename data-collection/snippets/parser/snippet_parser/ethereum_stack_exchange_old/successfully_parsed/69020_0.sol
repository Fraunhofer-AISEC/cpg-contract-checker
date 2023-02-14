pragma solidity 0.5.1;

contract ConstantAndTransaction {

    uint trivial;

    function getTrivial() public view returns(uint) {
        
        
        return trivial;
    }

    function add(uint x) public {
        
        
        trivial += getTrivial() + x;
    }
}
