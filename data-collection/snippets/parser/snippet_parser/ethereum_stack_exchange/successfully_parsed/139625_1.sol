

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";



struct CarData {
        string model;
        uint256 originalValue;
        uint256 milage;
        string color;
        uint256 yearOfMatriculation;
    }
    
contract CarToken is ERC721 {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    
    address private _owner;


    constructor() ERC721("CarToken", "CART") {
        
        _owner = msg.sender;
    }    
    
    CarData[] public carsData;
    
    mapping(address => uint256[]) private ownerByTokenId;
    
    mapping(uint256 => address) private tokenIdByOwner;
    
    mapping(uint256 => CarData) private tokenIdByCarData;


    modifier isOwner() {
        require(msg.sender == _owner, "Ownly owner of token may perform the given action");
        _;
    }

    function mint(string memory model, uint256 originalValue, uint256 milage, string memory color, uint256 yearOfMatriculation) public isOwner returns (uint256) {
        _tokenIds.increment();

        uint256 id = _tokenIds.current();
        _mint(msg.sender, id);
        CarData memory carData = CarData(
            model,
            originalValue,
            milage,
            color,
            yearOfMatriculation
        );

        ownerByTokenId[msg.sender].push(id);
        tokenIdByCarData[id] = carData;
        tokenIdByOwner[id] = msg.sender;
        return id;
    }

    
    function transfer(uint256 tokenId, address receiver) isOwner external payable {
        
        address owner = tokenIdByOwner[tokenId];
        require(owner != receiver, "You cannot transfer the token form yourself to yourself");
        
        _transfer(owner, receiver, tokenId);
        tokenIdByOwner[tokenId] = receiver;
        delete ownerByTokenId[owner][tokenId];
        ownerByTokenId[receiver].push(tokenId);        
    }

    function getMonthlyQuota(uint256 yearsOfExperience, uint256 milageCap, uint256 contractDuration, uint256 originalValue, uint256 carMilage) public pure returns (uint) {
        return milageCap * originalValue / (contractDuration * carMilage * yearsOfExperience * 100 * 12); 
    }

    function burn(uint256 tokenId) public {
        address owner = tokenIdByOwner[tokenId];
        delete ownerByTokenId[owner][tokenId];
        delete tokenIdByOwner[tokenId];
        _burn(tokenId);
    }

    
    function getCarData(uint256 tokenId) public view returns (CarData memory) {
        return tokenIdByCarData[tokenId];
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    function getAvailableCarsByAddress(address owner) public view returns (uint256[] memory) {
        return ownerByTokenId[owner];
    }

    
}
