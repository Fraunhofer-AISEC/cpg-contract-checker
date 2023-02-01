    
  mstore(0x40, 0x60)
    
  jumpi(tag_1, iszero(callvalue))
  0x0
  dup1
  revert
tag_1:
  mload(0x40)
  0x20
  dup1
  bytecodeSize
  dup4
  codecopy
  dup2
  add
  0x40
  mstore
  dup1
  dup1
  mload
  swap1
  0x20
  add
  swap1
  swap2
  swap1
  pop
  pop
    
  dup1
    
  0x0
  dup1
    
  0x100
  exp
  dup2
  sload
  dup2
  0xffffffffffffffffffffffffffffffffffffffff
  mul
  not
  and
  swap1
  dup4
  0xffffffffffffffffffffffffffffffffffffffff
  and
  mul
  or
  swap1
  sstore
  pop
    
  pop
    
  dataSize(sub_0)
  dup1
  dataOffset(sub_0)
  0x0
  codecopy
  0x0
  return
stop

sub_0: assembly {
        
      mstore(0x40, 0x60)
      jumpi(tag_1, lt(calldatasize, 0x4))
      calldataload(0x0)
      0x100000000000000000000000000000000000000000000000000000000
      swap1
      div
      0xffffffff
      and
      dup1
      0x38af3eed
      eq
      tag_2
      jumpi
    tag_1:
        
      0x0
      dup1
      swap1
      sload
      swap1
      0x100
      exp
      swap1
      div
      0xffffffffffffffffffffffffffffffffffffffff
      and
        
      0xffffffffffffffffffffffffffffffffffffffff
      and
        
      0x8fc
        
      callvalue
        
      swap1
      dup2
      iszero
      mul
      swap1
      mload(0x40)
      0x0
      mload(0x40)
      dup1
      dup4
      sub
      dup2
      dup6
      dup9
      dup9
      call
      swap4
      pop
      pop
      pop
      pop
      iszero
      iszero
      tag_5
      jumpi
      0x0
      dup1
      revert
    tag_5:
        
      stop
        
    tag_2:
      jumpi(tag_6, iszero(callvalue))
      0x0
      dup1
      revert
    tag_6:
      tag_7
      jump(tag_8)
    tag_7:
      mload(0x40)
      dup1
      dup3
      0xffffffffffffffffffffffffffffffffffffffff
      and
      0xffffffffffffffffffffffffffffffffffffffff
      and
      dup2
      mstore
      0x20
      add
      swap2
      pop
      pop
      mload(0x40)
      dup1
      swap2
      sub
      swap1
      return
    tag_8:
      0x0
      dup1
      swap1
      sload
      swap1
      0x100
      exp
      swap1
      div
      0xffffffffffffffffffffffffffffffffffffffff
      and
      dup2
      jump  

    auxdata: 0xa165627a7a72305820dd4c6e28e67e307f6f891abd170c6646cad8d99ce9c533e220d4362c5a3b2ab00029
}
