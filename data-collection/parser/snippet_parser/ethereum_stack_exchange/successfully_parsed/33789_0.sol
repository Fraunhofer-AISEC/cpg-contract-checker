pragma solidity 0.4.11;

import "./base/Ownable.sol";

contract TokenRegistry is Ownable {

mapping (address => TokenMetadata) public tokens;
mapping (string => address) tokenBySymbol;
mapping (string => address) tokenByName;

address[] public tokenAddresses;

struct TokenMetadata {
    address token;
    string name;
    string symbol;
    uint8 decimals;
    bytes ipfsHash;
    bytes swarmHash;
}

function addToken(
    address _token,
    string _name,
    string _symbol,
    uint8 _decimals,
    bytes _ipfsHash,
    bytes _swarmHash)
    public
    onlyOwner
    tokenDoesNotExist(_token)
    addressNotNull(_token)
    symbolDoesNotExist(_symbol)
    nameDoesNotExist(_name)
{
    tokens[_token] = TokenMetadata({
        token: _token,
        name: _name,
        symbol: _symbol,
        decimals: _decimals,
        ipfsHash: _ipfsHash,
        swarmHash: _swarmHash
    });
    tokenAddresses.push(_token);
    tokenBySymbol[_symbol] = _token;
    tokenByName[_name] = _token;

}

}