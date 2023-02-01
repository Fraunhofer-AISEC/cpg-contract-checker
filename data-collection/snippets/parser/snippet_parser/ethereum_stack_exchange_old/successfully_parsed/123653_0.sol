function getCalldata(string calldata _func, string calldata _param1, uint256 _param2) public pure returns (bytes memory) {
        return abi.encodeWithSignature(_func, _param1, _param2);
    }
