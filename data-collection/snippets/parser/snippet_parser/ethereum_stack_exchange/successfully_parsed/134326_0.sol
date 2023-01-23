mapping(address => mapping(address => uint256)) public approval_;

function approve(address spender, uint256 amount) external returns (bool) {
assembly {
  
  
  
  let msgsender
  mstore(msgsender, caller()) 
  let spender_
  mstore(spender_, spender) 

  let ptr := mload(0x40) 
  mstore(ptr, keccak256(spender_, 0x20)) 
  mstore(add(ptr, 0x20), msgsender) 
  mstore(add(ptr, 0x40), approval_.slot) 
  let googHash := keccak256(add(ptr, 0x20), 0x40) 
  mstore(add(ptr, 0x20), googHash)
  let approveSlot := keccak256(ptr, 0x40) 
  let balanceApproved := sload(approveSlot) 

  
  sstore(approveSlot, add(balanceApproved, amount))
}
return true;
}