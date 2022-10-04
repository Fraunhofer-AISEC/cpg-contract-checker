
function addToWhiteList(address trusted) public onlyOwner {
    require(!whitelist[trusted]);
    whitelist[trusted] = true;

    emit UserWhitelist(true);
}
