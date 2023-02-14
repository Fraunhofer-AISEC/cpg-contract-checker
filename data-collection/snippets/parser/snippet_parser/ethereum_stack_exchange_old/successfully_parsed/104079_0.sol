pragma solidity >=0.4.16 <0.9.0;

contract Convertion {
    function test(bytes32 _input) external pure returns (address) {
        return address(uint160(uint256(_input)));
    }
}
