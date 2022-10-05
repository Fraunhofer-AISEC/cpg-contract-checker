contract a {
    struct Str {
        uint256 totalTokens;
        mapping(address => uint256) playerTokens;
    }

    mapping(uint256 => Str) public tokenStores;
}
