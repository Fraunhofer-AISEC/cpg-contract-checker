pragma solidity ^0.4.17;

interface IERC20Token {
    function balanceOf(address owner) public returns (uint256);
    function transfer(address to, uint256 amount) public
    returns (bool);

}


contract ico {
  address private owner;
  address private ops;
  address private trustee;
  mapping(address => bool) public whitelist;


  modifier ownerFunction {
      require(owner == msg.sender);
       _;
  }

  modifier opsFunction {
    require(ops == msg.sender);
    _;
  }

  event Whitelist(address _address);
  event UnWhitelist(address _address);
  event Error(address _address);

  function setOpp (address _oppAddress) private ownerFunction {
    ops = _oppAddress;
  }

  function ico() internal {
    owner = msg.sender;
  }

  function buyTokens(uint256 _value) payable {
      if (getWhitelistStatus(msg.sender) == true) {
          require(balanceOf(msg.sender) >= msg.value);
          msg.sender.transfer(trustee, msg.value);
          return true;
       }
      else
          {
              revert();
              Error(msg.sender);
              returns false;
          }
    }

  function getWhitelistStatus(address _address) returns (bool) {
      return whitelist[_address];

  }

  function whitelist(address _address)opsFunction {
      whitelist[_address] = true;
      Whitelist(_address);


  }

  function unWhitelist(address _address)opsFunction {
      whitelist[_address] = false;
      UnWhitelist(_address);

  }


}
