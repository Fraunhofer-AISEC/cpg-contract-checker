function testAssembly(bytes32 _msg) public pure returns (bytes8 i, bytes8 j, bytes8 k, uint256 m, bytes memory size){
      assembly {
        let i_ptr := mload(0x40)
        let j_ptr := mload(0x62)
        let k_ptr := mload(0x92)

        m := calldataload(4)
        
        calldatacopy(i_ptr,0x4,8)
        calldatacopy(j_ptr,0x9,8)
        calldatacopy(k_ptr,0x11,8)

        i := mload(i_ptr)
        j := mload(j_ptr)
        k := mload(k_ptr)
      }
      return (i,j,k,m,size);
    }

 function testAssemblyArr(bytes32 _msg) public pure returns (bytes8 i, bytes8 j, bytes8 k, uint256 m, bytes memory size){

      bytes8[3] memory y = [bytes8(0), 0,0];

      assembly {

        m := calldataload(4)
        
        mstore(y,_msg)
        mstore(add(y,0x8),_msg)
        mstore(add(y,0x10),_msg)
      }
      return (y[0],y[1],y[2],m,size);
    }  
