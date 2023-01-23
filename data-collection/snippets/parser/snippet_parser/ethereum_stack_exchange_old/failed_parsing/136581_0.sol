(bool success, bytes memory data) = add.call(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
