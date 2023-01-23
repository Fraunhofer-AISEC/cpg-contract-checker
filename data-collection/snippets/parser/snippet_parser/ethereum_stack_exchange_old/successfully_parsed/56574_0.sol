pragma solidity 0.4.24;

contract Demo {
    struct SimpleStruct {
        uint256 a;
        uint256 b;
        address c;
    }

    function returnsSimpleStruct() public view returns (SimpleStruct){
        return SimpleStruct(0, 0, address(0));
    }

}
