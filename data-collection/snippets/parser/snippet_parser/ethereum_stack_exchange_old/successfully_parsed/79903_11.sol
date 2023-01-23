function getPrice(uint256 value, uint256 t, uint256 halfLife) public pure returns (uint256 price) {
    price = value >> (t / halfLife);
    price -= price * (t % halfLife) / halfLife / 2;
}
