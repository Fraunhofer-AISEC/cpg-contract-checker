pragma solidity ^0.4.24;

import '../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721BasicToken.sol';
import '../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract NFCertificate is ERC721BasicToken, Ownable {
    struct Certificate {
        uint certNum;
        uint256 tokenId;
        bytes32 title;
        bytes32 message;
        address owner;
    }

    mapping (uint256 => address) tokenToOwner;
    mapping (address => uint256) ownerToToken;
    mapping (uint256 => string) tokenIdToName;

    event returnNumbers(uint number);

    Certificate[] public certificates;

    function createCert(bytes32 title, bytes32 message) public returns (bytes32){
        uint certificateNum = certificates.length - 1; 
        uint256 tokenId = uint256(keccak256(certificateNum, msg.sender, title, message));
        certificates.push(Certificate(certificateNum++, tokenId, title, message, msg.sender));
        tokenToOwner[tokenId] = msg.sender;
        ownerToToken[msg.sender] = tokenId;
        _mint(msg.sender, tokenId);
    }

    function returnNumber() public returns(uint) {
        uint number = 1000;
        returnNumbers(number);
        return number;
    }

    function whatTokensDoYouOwn(address owner) public view returns(uint256) {
        return ownerToToken[owner]; 
    }


}
