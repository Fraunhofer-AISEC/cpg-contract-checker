function transferTo(address receiver, uint amount) {
    if (   amount == 0
        || receiver == address(this) )
        return;
