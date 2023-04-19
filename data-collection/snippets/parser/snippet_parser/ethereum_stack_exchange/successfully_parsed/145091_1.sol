pragma solidity >=0.8.18;

contract Foo {
    function getCode1() external view returns (bytes memory) {
        address addr1 = address(1);
        return addr1.code;
    }

    function getCode2() external view returns (bytes memory) {
        address addr2 = address(2);
        return addr2.code;
    }
}
