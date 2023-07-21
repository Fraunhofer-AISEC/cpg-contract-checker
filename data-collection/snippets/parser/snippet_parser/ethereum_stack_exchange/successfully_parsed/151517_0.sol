pragma solidity >=0.8.19;

interface WETHLike {
    function balanceOf(address account) external view returns (uint256 balance);
    function deposit() external payable;
}

contract MsgValue {
    WETHLike public weth;

    function foo() external payable {
        uint256 initialBalance = weth.balanceOf(address(this));
        weth.deposit{ value: msg.value }();
        uint256 finalBalance = weth.balanceOf(address(this));
        uint256 creditAmount = finalBalance - initialBalance;
        if (creditAmount < msg.value) {
            revert("insufficient credit amount");
        }
    }
}
