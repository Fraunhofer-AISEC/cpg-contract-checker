function execute() public checkExternalStatus checkDeadline(false) {
    uint256 balanceAmount = address(this).balance;
    require(balanceAmount > threshold, "threshold is not reached");
    (bool sent, ) = address(exampleExternalContract).call{
    value: balanceAmount
    }(abi.encodeWithSignature("complete()"));
require(sent, "exampleExternalContract.complete failed");
}
