import "./TypesLib.sol"

library CustomLib {
    function transfer(TypesLib.TokenStorage storage self, address to, uint256 amount) public returns (bool) {
        ... custom implementation ...
    }
}
