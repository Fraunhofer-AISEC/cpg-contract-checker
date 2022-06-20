pragma solidity ^0.5.8;

contract Test {
    function multipleTransfer(address payable[] memory _addr, uint256 _amount) public {
        uint256 len = _addr.length;
        for (uint256 i = 0; i < len; i+=1) {
            _addr[0].transfer(_amount);
        }
    }
}
