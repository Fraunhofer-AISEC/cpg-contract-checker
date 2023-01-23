pragma solidity ^0.8.4;


contract Test {
    uint value;
    
    function set(uint n) external{
        value = n;
    }
    
    function get() external view returns(uint) {
        return value;
    }
    
    function callByName(string calldata functionSignature, bytes calldata parameters) external returns(bytes memory) {
        (bool success, bytes memory data) = address(this).delegatecall(
            abi.encodeWithSelector(
                bytes4(
                    keccak256(bytes(functionSignature))
                ),
                parameters
            )
        );
        require(success, 'Call failed');
        return data;
    }
}
