function test() public {
            uint[] memory arr = new uint[](2);
            arr[0] = 3;
            arr[1] = 4;
    
            (bool success, ) = address(this).call
                  (
                    abi.encodeWithSignature(
                        "callMe(uint[])",
                        arr
                  )
            );
         
}
    
