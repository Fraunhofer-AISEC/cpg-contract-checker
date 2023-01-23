pragma solidity ^0.4.24;


contract Ownable {
  address public owner;


  
  constructor() public {
    owner = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
  }


  
  modifier onlyOwner() {
    if (msg.sender != owner) {
      throw;
    }
    _;
  }


  
  function transferOwnership(address newOwner) public onlyOwner {
    if (newOwner != address(0)) {
      owner = newOwner;
    }
  }

}

contract Token{
  function transfer(address to, uint value) public returns (bool);
}

contract Airdrop1 is Ownable {

    function multisend(address _tokenAddr, address[] _to, uint256[] _value) public
    returns (bool _success) {
        assert(_to.length == _value.length);
        assert(_to.length <= 150);
        
        for (uint8 i = 0; i < _to.length; i++) {
                assert((Token(_tokenAddr).transfer(_to[i], _value[i])) == true);
            }
            return true;
        }
}
