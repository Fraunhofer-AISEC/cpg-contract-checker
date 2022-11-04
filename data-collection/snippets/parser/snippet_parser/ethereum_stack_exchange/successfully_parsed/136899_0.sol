 function subscribe(
    uint plan,
    address payable _user,
    
    uint price
) public payable returns (bool success) {
    
    User storage user = users[_user];
    if (plan == 1) {
        require(token.allowance(msg.sender, address(this)) > 0);
        price = token.allowance(msg.sender, address(this));
        require(token.transferFrom(msg.sender, address(this), price));
        _user.transfer(price);
        user.playablePlaylists += 100;
        token.transferFrom(address(this), owner, (price / 11));
        user.isSubscribed = true;

        emit Subscribed(_user, price, plan);
        return true;
    }
    if (plan == 2) {
        require(token.allowance(msg.sender, address(this)) > 0);
        price = token.allowance(msg.sender, address(this));
        require(token.transferFrom(msg.sender, address(this), price));
        _user.transfer(price);
        user.playablePlaylists += 200;
        token.transferFrom(address(this), owner, price / 11);
        user.isSubscribed = true;

        emit Subscribed(_user, price, plan);
        return true;
    }
    if (plan == 3) {
        require(token.allowance(msg.sender, address(this)) > 0);
        price = token.allowance(msg.sender, address(this));
        require(token.transferFrom(msg.sender, address(this), price));
        _user.transfer(price);
        user.playablePlaylists += 300;
        token.transferFrom(address(this), owner, (price / 11));
        user.isSubscribed = true;

        emit Subscribed(_user, price, plan);
        return true;
    }
}
