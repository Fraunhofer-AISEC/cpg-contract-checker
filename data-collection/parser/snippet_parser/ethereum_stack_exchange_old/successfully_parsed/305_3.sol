function getBalance(address addr) returns (uint, uint) {
    mapping(address => uint)  balancers;
    balancers[msg.sender] = 500;

    return (balancesA[addr], balancesB[addr]);
}
