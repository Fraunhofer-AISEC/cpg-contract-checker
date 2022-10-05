function initialize(address creator, address payer) external {
    require(!initialized, "dao already initialized");
    initialized = true;
    ..
}
