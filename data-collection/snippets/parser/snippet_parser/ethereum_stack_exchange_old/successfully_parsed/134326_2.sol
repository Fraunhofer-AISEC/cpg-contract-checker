    mapping(address => mapping(address => uint256)) public approval_;

    function approve(address spender, uint256 amount) external returns (bool) {
      assembly {
        
        mstore(0x00, caller())
        mstore(0x20, approval_.slot)
        let googHash := keccak256(0x00, 0x40) 
        
        
        
        mstore(0x00, spender)
        mstore(0x20, googHash)
        let approveSlot := keccak256(0x00, 0x40)
        
        
        let balanceApproved := sload(approveSlot)

        
        sstore(approveSlot, add(balanceApproved, amount))
      }
      return true;
    }
