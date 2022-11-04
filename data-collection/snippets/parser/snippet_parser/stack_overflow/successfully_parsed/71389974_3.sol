library TokenTrait {
    function getName(Token memory token) external pure returns (string memory) {
        return token.name;
    }
}
