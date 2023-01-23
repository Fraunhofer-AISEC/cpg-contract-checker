import "./TypesLib.sol"

library DefaultLib {
    function transfer(TypesLib.TokenStorage storage self, address to, uint256 amount) public returns (bool) {
        ... default implementation ...
    }
}
