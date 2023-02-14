import "./TypesLib.sol"
import "./DefaultLib.sol"
import "./CustomizedLib.sol"

library CustomLib {
    using DefaultLib for TypesLib.TokenStorage;
    using CustomizedLib for TypesLib.TokenStorage;

    TypesLib.TokenStorage token;

    function transfer(address to, uint256 amount) public returns (bool success) {
        return token.transfer(to, amount)
}
}