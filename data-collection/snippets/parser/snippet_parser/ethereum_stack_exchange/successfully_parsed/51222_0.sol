
contract Contribution {
  string data;
  bool forSale;
  address owner;

  function Contribution(string _data, address _contributor) {
    data = _data;
    owner = _contributor;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function offer() public payable {
    require(msg.value > 0);
    require(forSale == true);
    forSale = false;
  }

  function deny() public onlyOwner {
    require(forSale == true);
    forSale = true;
  }

  function claim() public onlyOwner {
    require(address(this).balance > 0);
    selfdestruct(owner);
  }
}


contract ContributionFactory {
  address[] contributions;

  function contribute(string _data) public returns(address) {
    address contribution = new Contribution(_data, msg.sender);
    contributions.push(contribution);
    return contribution;
  }
}
