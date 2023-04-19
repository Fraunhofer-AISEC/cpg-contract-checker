contract Manager {

    XYZToken xyzToken;

    constructor(address _xyzToken) {
        xyzToken = XYZToken(_lendToken);
    }

    function mintTokens(uint256 _amount) external nonReentrant {
        xyzToken.mint(msg.sender, _amount);
    }
}