function sumTwoParams (uint256 _num1, uint256 _num2) public {     
        bytes memory payload = abi.encodeWithSignature("sumTwoParams(uint256, uint256)", _num1, _num2);
        (bool success, bytes memory returnData) = otherContract.call(payload);
        require(success, "Failed!");
        
        (sumResult) = abi.decode(returnData, (uint256));
    } 
