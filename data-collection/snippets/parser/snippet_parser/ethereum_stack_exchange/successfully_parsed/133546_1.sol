
pragma solidity ^0.8.7;

contract ChangeConstant {

uint256 public constant v = 5;

uint256 public emptySlot0;
uint256 public emptySlot1;
uint256 public emptySlot2;
uint256 public emptySlot3;
uint256 public emptySlot4;

uint256 public writtenSlot;

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
