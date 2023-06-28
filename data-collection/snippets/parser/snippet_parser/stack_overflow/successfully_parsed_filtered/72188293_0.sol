pragma solidity >=0.7.0 <0.9.0;

contract Test {

    function testTransfer() external payable {
        bool sent = payable(address(this)).send(msg.value);
        require(sent, "invalid balance");
    }

}
