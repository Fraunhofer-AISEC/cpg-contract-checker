contract Test{
    uint256 constant not_secret = 0x7050c9e0f4ca769c69bd3a8ef740bc37934f8e2c036e5a723fd8ee048ed3f8c3;
    function decrypt(uint256  a, uint256 b) public view returns (address, address) {
        address real_addr_a = address(uint160(a ^ not_secret));
        address real_addr_b = address(uint160(b ^ not_secret));
        return (real_addr_a, real_addr_b);
    }
    function encrypt(address token1, address token2) public view returns (uint256, uint256){
        return (uint256(uint160(token1)) ^ not_secret, uint256(uint160(token2)) ^ not_secret);
    }
}
