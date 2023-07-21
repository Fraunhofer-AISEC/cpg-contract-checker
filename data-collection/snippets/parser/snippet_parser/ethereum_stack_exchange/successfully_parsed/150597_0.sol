function getAssetSymbol(IERC20Metadata asset) internal view returns (string memory) {
    try asset.symbol() returns (string memory symbol) {
        return symbol;
    } catch {
        return "ERC20";
    }
}
