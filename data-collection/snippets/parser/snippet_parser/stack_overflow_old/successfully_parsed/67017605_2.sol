function equity_in_pendulum(address investor) external view returns (uint) { 
    return equity_pendulum[investor];
}
