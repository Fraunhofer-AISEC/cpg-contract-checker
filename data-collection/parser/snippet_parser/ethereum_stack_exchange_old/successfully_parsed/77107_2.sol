function _forwardFunds() internal {
    (bool success, ) = _wallet.call.value(msg.value)("");
    require(success, "Failed to forward funds");
}
