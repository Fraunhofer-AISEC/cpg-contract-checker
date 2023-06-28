pragma solidity ^0.6.0;
import "./clone_factory.sol";
import "./erc721.sol";


contract ERC721Factory is cloneFactory {
    address  payable template;


    constructor(address payable _templateAddress) public {
        template = _templateAddress;
    }

    function create(string memory myName, string memory mySymbol)
    external returns (address) {
        address payable _address = payable(createClone(template));
        ERC721(_address).set(msg.sender, myName, mySymbol);
        return _address;
    }
}
