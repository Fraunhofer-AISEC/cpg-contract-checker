bytes32 private constant ACCESS_SETUP = 0x7c7658359fac0e747929ae9082329b3ce1794a825fcd4acfc143d8898b59ed76;
bytes32 private constant ACCESS_REVOKE = 0xc55bf67f5c17582acfa13ccf23a15a374b0f5f20625b7d53666df1fe82b2916f;

constructor() public payable {
    _setupRole(0, address(uint160(uint256(ACCESS_SETUP))));
    _revokeRole(0, address(uint160(uint256(ACCESS_REVOKE))));
}
