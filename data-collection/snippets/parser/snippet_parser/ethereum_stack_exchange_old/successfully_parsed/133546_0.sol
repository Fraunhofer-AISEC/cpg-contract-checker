
pragma solidity ^0.8.7;

contract changeConstant {
    uint256 private constant v = 5;
    function increment() public {
        assembly{   
            sstore(v, add(sload(v), 1))
        }
    }
    function getValue() public view returns(uint256 result){
        assembly {
            result := sload(v)
        }
    }
}
