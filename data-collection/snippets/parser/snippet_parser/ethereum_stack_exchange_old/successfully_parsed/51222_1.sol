
contract Contributions {
  struct Contribution {
    string data;
    bool forSale;
    uint256 offer;
  }

  mapping (address => Contribution) contributions;

  function contribute(string _data) public returns(address) {
    contributions[msg.sender] = Contribution(_data, false, 0);
  }

  function offer(address _contributor) payable {
    require(msg.value > 0);

    Contribution contribution = contributions[_contributor];
    require(contribution.forSale == true);

    contribution.forSale = false;
    contribution.offer = msg.value;

    contributions[_contributor] = contribution;
  }

  function deny(address _contributor) public {
    Contribution contribution = contributions[_contributor];
    require(contribution.forSale == true);
    contribution.forSale = true;
    contributions[_contributor] = contribution;
  }

  function claim(address _contributor) public {
    require(msg.sender == _contributor);
    require(address(this).balance > 0);

    msg.sender.transfer(contributions[_contributor].offer);
    delete(contributions[_contributor]);
  }
}
