(...)
      GAS           gasleft()
      PUSH 0            uint256 dataLocal
      SLOAD             data
      SWAP1             uint256 gasUsed = gasleft()
      SWAP2             uint256 gasUsed = gasleft()
      POP           
      GAS           gasleft()
(...)
