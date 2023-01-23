contract ERC721CrowdSale is Ownable { ... }


contract CS_Creator is Ownable{
  ERC721CrowdSale _cs;

  function create_crowdsale(string _name, address _wallet, uint256 _token_goal) onlyOwner returns(address){
      address _new_crowdsale = new ERC721CrowdSale(_name,  _wallet,  _token_goal);
      transfer_CS_ownership(_new_crowdsale, _wallet);
      return _new_crowdsale;
  }

  function transfer_CS_ownership (address _new_crowdsale, address _wallet)  internal {
     _cs = ERC721CrowdSale(_new_crowdsale);
    _cs.transferOwnership(_wallet);
  }
}
