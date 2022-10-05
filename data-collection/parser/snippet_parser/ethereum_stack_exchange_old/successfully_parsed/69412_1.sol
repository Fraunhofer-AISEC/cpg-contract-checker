contract MyErc20Contract {
    function transfer(address to, uint256 value) public returns (bool) {
        bytes32 data1 = keccak256("func1(uint256)");
        bytes32 data2 = keccak256("func2(uint256,bool)");
        bytes32 data3 = keccak256("func3(uint256,uint256)");
        bool result1 = external_call(to, 0, data1.length, abi.encodePacked(data1));
        bool result2 = external_call(to, 0, data2.length, abi.encodePacked(data2));
        bool result3 = external_call(to, 0, data3.length, abi.encodePacked(data3));
        if (result1 && result2 && result3) {
            
        }
        else {
            
        }
    }

    function external_call(address destination, uint value, uint dataLength, bytes data) private returns (bool) {
        bool result;
        assembly {
            let x := mload(0x40)   
            let d := add(data, 32) 
            result := call(
                sub(gas, 34710),   
                                   
                                   
                destination,
                value,
                d,
                dataLength,        
                x,
                0                  
            )
        }
        return result;
    }
}
