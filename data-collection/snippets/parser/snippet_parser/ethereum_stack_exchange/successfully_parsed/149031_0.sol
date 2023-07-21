function numberMarker() internal view {
    assembly {mstore(0, number())}
}
