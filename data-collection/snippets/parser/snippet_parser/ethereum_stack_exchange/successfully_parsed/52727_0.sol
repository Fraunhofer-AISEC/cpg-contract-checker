pragma solidity ^0.4.19;

contract ethTransferTest {
    function ethTrans(address _to) payable public {
        uint256 pay = msg.value;
        _to.transfer(pay);
    }
}
