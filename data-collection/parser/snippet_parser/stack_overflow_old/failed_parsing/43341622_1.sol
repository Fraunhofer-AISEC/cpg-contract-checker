uint256 mock_time;

function SNTPlaceHolderMock(...)
        SNTPlaceHolder(...) {
    mock_time = now;
}

function getTime() internal returns (uint256) {
    return mock_time;
}

function setMockedTime(uint256 _t) public {
    mock_time = _t;
}
