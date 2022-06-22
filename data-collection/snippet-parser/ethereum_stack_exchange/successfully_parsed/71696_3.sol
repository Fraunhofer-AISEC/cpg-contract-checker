function sweep(address _token, uint _amount)
canSweep
returns (bool) {
    bool success = false;
    address destination = controller.destination();

    if (_token != address(0)) {
        Token token = Token(_token);
        uint amount = _amount;
        if (amount > token.balanceOf(this)) {
            return false;
        }

        success = token.transfer(destination, amount);
    }
    else {
        uint amountInWei = _amount;
        if (amountInWei > this.balance) {
            return false;
        }

        success = destination.send(amountInWei);
    }

    if (success) {
        controller.logSweep(this, destination, _token, _amount);
    }
    return success;
}
