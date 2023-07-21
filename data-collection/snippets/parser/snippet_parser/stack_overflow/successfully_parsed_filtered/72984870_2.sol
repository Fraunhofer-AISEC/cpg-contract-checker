interface IExchangeRate {
    function tinycentsToTinybars(uint256 tinycents) external returns (uint256);
    function tinybarsToTinycents(uint256 tinybars) external returns (uint256);
}
