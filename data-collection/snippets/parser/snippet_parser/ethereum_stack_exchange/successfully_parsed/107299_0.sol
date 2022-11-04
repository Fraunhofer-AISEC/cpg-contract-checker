contract Sink {

  mapping (address => uint256) private _shares;
  constructor(address holder, uint256 share) {
    _shares[holder] = share;
  }

  receive () external payable {}
}
