contract Test {

    struct Wrapper {
        uint256 value;
    }

    function edgeCase(uint256 amount, bytes memory data) public pure returns (bytes memory, Wrapper memory walue) {

        
        
        

        
        
        Wrapper memory wrapper;

        wrapper.value = 0;

        
        
        
        
        
        
        
        return (encodeAmount(amount, data), wrapper);
    }


    function encodeAmount(uint256 amount, bytes memory data) public pure returns(bytes memory) {

        require(data.length == 68, "Expected 68 bytes of data");

        assembly {
            
            
            mstore(add(add(data, 32), 68), amount)

            
            mstore(data, add(mload(data), 32))

            
            
            mstore(0x40, add(data, add(mload(data), 32)))
        }
        return data;
    }
}
