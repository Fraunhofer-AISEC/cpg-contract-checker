
pragma solidity ^0.8.0;

interface IERC20 {

}

contract PackInterface {

  
  IERC20 public token;

  
  uint96 packed;

  
  uint8 notPacked;

  function getSlots() public view returns (uint256 tokenSlot, uint256 packedSlot, uint256 notPackedSlot) {
    assembly {
      tokenSlot := token.slot
      packedSlot := packed.slot
      notPackedSlot := notPacked.slot
    }

    
  }

}
