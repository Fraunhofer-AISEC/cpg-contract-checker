pragma solidity >=0.5.0 <0.7.0;

contract HelloWorld {

function concatenate(
        string calldata Hello,
        string calldata World)
        external 
        pure
        returns(string memory) {
            return string(abi.encodePacked(Hello, World));
        }
}
