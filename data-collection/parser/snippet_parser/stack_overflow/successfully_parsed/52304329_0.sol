pragma solidity ^0.4.24;
import "./openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol"; 
import "./openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "./openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol";


contract SSale is CappedCrowdsale, ERC721Full {

using SafeMath for uint256;

IERC721 private _token;


constructor(uint256 _rate, address _wallet, IERC721 token,
uint _cap,
string name, string symbol) public
Crowdsale(_rate, _wallet, _token)
CappedCrowdsale(_cap)
ERC721Full(name, symbol){}
}
