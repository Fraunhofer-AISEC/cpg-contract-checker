pragma solidity 0.5.16;

contract Test {
    function getAdd() public view returns(address){
        address add = address(this);
        return add;
    }
}
