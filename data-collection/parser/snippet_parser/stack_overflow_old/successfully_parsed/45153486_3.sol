function setEthPrice(uint _etherPrice) onlyOwner {
    oneTokenInWei = 1 ether * 2 / _etherPrice / 100;
    changed(msg.sender);
}
