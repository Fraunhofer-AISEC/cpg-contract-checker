

function unwrapArray(UD60x18[] memory foo) internal pure returns (uint256[] memory bar) {
    assembly {
        bar := foo
    }
}
