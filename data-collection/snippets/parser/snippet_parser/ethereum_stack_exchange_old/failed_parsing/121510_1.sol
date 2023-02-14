event StaticCallCheck();

function staticCallChecker() external {
    require(msg.sender == address(this), "Access denied");
    emit StaticCallCheck();
}
