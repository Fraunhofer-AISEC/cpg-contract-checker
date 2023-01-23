
pragma solidity ^0.8.0;

contract Test {

    
    function test() public pure returns (bytes32 data) {

        
        bytes memory array =  '\xFF\xFF';

        
        
        assembly {
            data := mload(add(array, 32))
        }

        
    }

}
