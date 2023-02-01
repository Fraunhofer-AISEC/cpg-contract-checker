function buyGameBundle(string calldata id) external nonReentrant {
    structGameBundles  memory currentItem = _gameBundles[id];
    require(currentItem.exists == true, "bundle does not exists");
    require(currentItem.totalSupply > 0, "there are no more bundles left");
    if (currentItem.cost > 0) {
        erc20.transfer(_feesAccount, currentItem.cost);
    }
    currentItem.totalSupply = currentItem.totalSupply.sub(1);
    _gameBundles[id] = currentItem;
    emit BuyGameBundle(_msgSender(), id, currentItem.cost);
}
