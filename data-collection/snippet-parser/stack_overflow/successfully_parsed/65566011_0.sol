struct Sub {
        uint256 amount;
        uint256 createdTime;
}

mapping(address => Sub) private _addrBalances;
address[] private _ownerAddresses;
uint MONTH = 30 days;
uint256 private _totalSupply;


function expireAccounts() external onlyOwner(_owner) {
        address[] storage _ownersLeft;
        for (uint i = 0; i < _ownerAddresses.length; i++) {
            if ((_addrBalances[_ownerAddresses[i]].createdTime + MONTH) >= block.timestamp) {
                _totalSupply -= _addrBalances[_ownerAddresses[i]].amount;
                _addrBalances[_ownerAddresses[i]].amount = 0;
                _addrBalances[_ownerAddresses[i]].createdTime = 0;
            } else {
                _ownersLeft.push(_ownerAddresses[i]);
            }
        }
        _ownerAddresses = _ownersLeft;
    }
