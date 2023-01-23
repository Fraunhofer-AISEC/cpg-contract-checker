pragma solidity ^0.4.19;

contract Ownable {

    address public owner;

    function Ownable() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}

contract ERC721CrowdSale is Ownable {

    string public name;
    address public wallet;
    uint256 public token_goal;

    function ERC721CrowdSale(string _name, address _wallet, uint256 _token_goal) public {
        name = _name;
        wallet = _wallet;
        token_goal = _token_goal;
    }
    

}

contract CS_Creator is Ownable{
  ERC721CrowdSale _cs;

  function create_crowdsale(string _name, address _wallet, uint256 _token_goal) onlyOwner returns(address, address){
      address _new_crowdsale = new ERC721CrowdSale(_name,  _wallet,  _token_goal);
      transfer_CS_ownership(_new_crowdsale, _wallet);
      return (_new_crowdsale, get_CS_ownership(_new_crowdsale));
  }

  function transfer_CS_ownership(address _new_crowdsale, address _wallet)  internal {
      _cs = ERC721CrowdSale(_new_crowdsale);
      _cs.transferOwnership(_wallet);
  }

  function get_CS_ownership(address _crowdsale) public returns(address) {
      return ERC721CrowdSale(_crowdsale).owner();
  }
}
