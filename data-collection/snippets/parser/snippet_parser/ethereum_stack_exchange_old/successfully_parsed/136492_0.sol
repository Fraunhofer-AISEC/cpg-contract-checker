contract Access {
  address private _owner;

  constructor() {
    _owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == _owner, 'only owner');
    _;
  }

  function pub() external {}
  function priv() external onlyOwner {}
}
