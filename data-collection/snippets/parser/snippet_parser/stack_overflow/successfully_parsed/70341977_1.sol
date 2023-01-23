pragma solidity ^0.8;

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/utils/StringsUpgradeable.sol";


contract NFT is Initializable, ERC721EnumerableUpgradeable, OwnableUpgradeable {

    
    using StringsUpgradeable for uint256; 
}
