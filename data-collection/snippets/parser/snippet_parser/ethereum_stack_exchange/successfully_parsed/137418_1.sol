bytes[] memory dataArray = new bytes[](1);
(bool success, bytes memory returnData) = CONTRACT_ADDRESS.call(
            abi.encodeWithSignature("doStuff(bytes[])", dataArray)
        );
