bytes out = abi.encodeWithSelector(
      bytes4(keccak256(bytes("someFunction(uint,uint,address[],address,uint)"))),
      a,
      b,
      ["0xAddr1Here", "0xAddr2Here"],
      "0xAddr3Here",
      e
    )
