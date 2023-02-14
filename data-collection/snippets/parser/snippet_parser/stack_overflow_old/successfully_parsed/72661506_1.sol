

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "./ERC721AWithRoyalties.sol";

contract Turtles is Ownable, ERC721AWithRoyalties, Pausable, PaymentSplitter {
    string public _baseTokenURI;

    bytes32 public _merkleRoot;

    uint256 public _price;
    uint256 public _presalePrice;
    uint256 public _maxSupply;
    uint256 public _maxPerAddress;
    uint256 public _presaleMaxPerAddress;
    uint256 public _publicSaleTime;
    uint256 public _preSaleTime;
    uint256 public _maxTxPerAddress;
    mapping(address => uint256) private _purchases;

    event EarlyPurchase(
        address indexed addr,
        uint256 indexed atPrice,
        uint256 indexed count
    );
    event Purchase(
        address indexed addr,
        uint256 indexed atPrice,
        uint256 indexed count
    );

    constructor(
        string memory name,
        string memory symbol,
        string memory baseTokenURI, 
        uint256[] memory numericValues, 
        bytes32 merkleRoot,
        address[] memory payees,
        uint256[] memory shares,
        address royaltyRecipient,
        uint256 royaltyAmount
    )
}