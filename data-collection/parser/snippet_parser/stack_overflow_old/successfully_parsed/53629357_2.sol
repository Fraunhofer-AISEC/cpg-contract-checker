pragma solidity >0.4.99 <0.6;

contract Target {
    event Received(uint256 amount);

    function deposit() external payable {
        emit Received(msg.value);
    }
}

contract Delegater {
    function deposit() external payable {
        (bool success,) = address(new Target()).delegatecall(abi.encodeWithSignature("deposit()"));
        require(success);
    }
}
