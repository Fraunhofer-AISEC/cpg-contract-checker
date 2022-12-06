
mapping(address => mapping(bytes32 => uint256)) private s_traderBalances;


function getBalance(bytes32 ticker) external view returns(uint256) {
    return s_traderBalances[msg.sender][ticker];
}

