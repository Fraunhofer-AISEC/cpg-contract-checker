pragma solidity 0.4.25;

contract MyContract1 {
    uint256 public successCount;
    uint256 public failureCount;

    function() external payable {}

    function test(address wallet, uint256 amount) external {
        if (wallet.send(amount))
            successCount++;
        else
            failureCount++;
    }
}

contract MyContract2 {
    function() external payable {}
}

contract MyContract3 {
    function() external payable {revert();}
}
