pragma solidity >=0.4.21 <0.6.0;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract MyToken is ERC721Full, ERC721Mintable{

  string name;
  string symbol;

  constructor (string memory _name, string memory _symbol) public 
ERC721Full(_name, _symbol) {
     
     name=_name;
     symbol=_symbol;
  }
}
