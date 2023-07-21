function initialize(
    VaultDetails memory _VAULT_DETAILS,
    address[] memory _WHITELISTED_ASSETS,
    Whitelisted[] memory _WHITELISTED_DETAILS
) external {
    VAULT_DETAILS = _VAULT_DETAILS;
    WHITELISTED_ASSETS = _WHITELISTED_ASSETS;

    uint length = _WHITELISTED_ASSETS.length;
    uint32 max_exposure;
    for (uint i = 0; i < _WHITELISTED_ASSETS.length; i++) {
        WHITELISTED_DETAILS[_WHITELISTED_DETAILS[i].collection] = _WHITELISTED_DETAILS[i];
        idx[_WHITELISTED_DETAILS[i].collection] = i;

        if (_WHITELISTED_DETAILS[i].MAX_EXPOSURE > max_exposure) {
            MAIN_ASSET = _WHITELISTED_ASSETS[i];
            max_exposure = _WHITELISTED_DETAILS[i].MAX_EXPOSURE;
        }
    }
}
