function mint(uint256 amountToMint) external onlyOwner() {
    assembly {
      
      let maxSupplySlot := sload(maxSupply.slot)
      let res := lt(add(amountToMint, mload(counter.slot)), add(maxSupplySlot, 1))
      let ptrError := mload(0x40)
      mstore(ptrError, 14)
      mstore(add(ptrError, 0x20), 0x4d6178537570706c795265616368) 
      if iszero(res) { revert(ptrError, 0x40) }

      
      let ptr := mload(0x40)
      mstore(ptr, caller())
      mstore(add(ptr, 0x20), balanceOf.slot)
      let slot := keccak256(ptr, 0x40)
      sstore(slot, amountToMint)

      
      let counterSlot := sload(counter.slot)
      let resCounter := add(counterSlot, amountToMint)
      sstore(counter.slot, resCounter)
    }
  }
