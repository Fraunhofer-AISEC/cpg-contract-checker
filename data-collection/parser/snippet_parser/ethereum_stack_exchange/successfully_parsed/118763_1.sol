function myFn(uint[] calldata tokenIds, uint8 v, bytes32 r, bytes32 s) external {

  require(
    _signerAddress == ecrecover(
      keccak256(abi.encodePacked(
        "\x19Ethereum Signed Message:\n32",


        
        
        

        keccak256(abi.encodePacked(
          
          Strings.toString(tokenIds.length),
          
          Strings.toString(state),
          
          keccak256(abi.encodePacked(msg.sender))
        ))

      ))
      , v, r, s
    ),
    'mint not allowed'
  );
}
