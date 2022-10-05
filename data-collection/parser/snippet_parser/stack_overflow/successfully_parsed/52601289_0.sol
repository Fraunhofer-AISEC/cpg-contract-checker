mapping(address => bool) _holderList;

function transferFrom(address from, address to, uint256 amount) {
    checkHolderList(from);
    checkHolderList(to);
    _transfer(from, to, amount);
}

function checkHolderList(address _address) {
    require(balanceOf(_address) > 0, "this address can't be holder");
    require(_holderList[address] != true, "this address is already in holder list");
    _holderList[_address] = true;
}
