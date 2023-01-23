pragma solidity ^0.4.2;

import "./ERC721Token.sol";
import "./CryptofieldBase.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract CToken is ERC721Token {
    using SafeMath for uint256;

    uint256 stallionsAvailable = 168;
    uint256 maresAvailable = 379;
    uint256 coltsAvailable = 230;
    uint256 filliesAvailable =  334;

    
    address[] addresses;
    address cryptofieldBase;

    constructor(address _cryptofieldBase) ERC721Token("CToken", "CT") public {
        cryptofieldBase = _cryptofieldBase;
    }

    
    function getOwnedTokens(address _from) public view returns(uint256[]) {
        return super.getOwnedTokens(_from);
    }

    function createHorse(address _owner, string _hash) public payable {
        require(stallionsAvailable > 0);

        uint256 tokenId = addresses.push(_owner) - 1;

        _mint(_owner, tokenId);
        CryptofieldBase(cryptofieldBase).buyHorse(_owner, _hash);

        stallionsAvailable = stallionsAvailable.sub(1);
    }

    function transferTokenTo(address _from, address _to, uint256 _tokenId) public {
        safeTransferFrom(_from, _to, _tokenId);
    }

    function ownerOfToken(uint256 _tokenId) public view returns(address) {
        return ownerOf(_tokenId);
    }

    function approveAddress(address _to, uint256 _tokenId) public {
        approve(_to, _tokenId);
    }

    
    function tokenSold(address _from, address _to, uint256 _tokenId) public {
        safeTransferFrom(_from, _to, _tokenId);
        CryptofieldBase(cryptofieldBase).horseSold(_tokenId);
    }
}
