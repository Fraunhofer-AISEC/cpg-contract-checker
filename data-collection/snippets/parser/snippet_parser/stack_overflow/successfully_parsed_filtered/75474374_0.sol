    modifier initializer() {
    bool isTopLevelCall = !_initializing;
    require(
        (isTopLevelCall && _initialized < 1) || (!AddressUpgradeable.isContract(address(this)) && _initialized == 1),
        "Initializable: contract is already initialized"
    );
    _initialized = 1;
    if (isTopLevelCall) {
        _initializing = true;
    }
    _;
    if (isTopLevelCall) {
        _initializing = false;
        emit Initialized(1);
    }
}
