    function verify(bytes memory signature, address target) public view returns (bool) {
        uint8 v;
        bytes32 r;
        bytes32 s;

        (v, r, s) = splitSignature(signature);
        bytes32 senderHash = keccak256(abi.encodePacked(target));
        
        return (verifier == address(ecrecover(senderHash, v, r, s)));
    }

  
  function splitSignature(bytes memory sig)
       internal
       pure
       returns (uint8, bytes32, bytes32)
   {
       require(sig.length == 65);
       
       bytes32 r;
       bytes32 s;
       uint8 v;

       assembly {
           
           r := mload(add(sig, 32))
           
           s := mload(add(sig, 64))
           
           v := byte(0, mload(add(sig, 96)))
       }

       return (v, r, s);
   }

