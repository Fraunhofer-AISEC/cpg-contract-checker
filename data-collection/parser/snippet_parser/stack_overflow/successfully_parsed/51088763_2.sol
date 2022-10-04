function getPrice(uint256 value, uint256 t, uint256 halfLife) public pure returns (uint256 price) {
    value >>= (t / halfLife);
    t %= halfLife;
    price = value - value * t / halfLife / 2;
}
