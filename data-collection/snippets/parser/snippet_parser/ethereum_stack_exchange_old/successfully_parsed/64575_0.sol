mapping(address => uint256) private funds;

function checkFunds() external view returns(uint256) {
    return contract2.checkFunds(msg.sender);
}
