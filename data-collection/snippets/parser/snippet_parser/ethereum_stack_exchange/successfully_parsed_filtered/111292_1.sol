function isValidData(bytes memory sig) public view returns(address){
       bytes32 message = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", msg.sender)); 
       return recoverSigner(message, sig);
  }

  function recoverSigner(bytes32 message, bytes memory sig)
       public
       pure
       returns (address)
    {
       uint8 v;
       bytes32 r;
       bytes32 s;

       (v, r, s) = splitSignature(sig);
       return ecrecover(message, v, r, s);
  }

  function splitSignature(bytes memory sig)
       public
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
