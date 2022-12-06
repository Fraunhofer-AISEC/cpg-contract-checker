
pragma solidity ^0.8.0;

contract Test {

    function test() public pure returns (uint256 length) {

        
        bytes memory array =  '\xFF\xFF';

        
        
        assembly {
            length := mload(array)
        }

        
    }
}
