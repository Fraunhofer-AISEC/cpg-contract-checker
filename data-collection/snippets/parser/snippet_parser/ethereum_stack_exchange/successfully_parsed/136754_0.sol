

pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.4.2/utils/Counters.sol";

contract CoinExGallery is ERC721, Ownable {

    struct Painting {
        string name;
        int256 posX;
        int256 posY;
        int256 posZ;
        int256 rotX;
        int256 rotY;
        int256 rotZ;
        uint256 width;
        uint256 aspect;
        string url;
    }

    uint256 public maxSupply = 10;
    uint256 public galleryIndex;

    constructor(uint256 _galleryIndex, Painting[] memory _paintings) ERC721("COINEXGALLERY", "CEG")  {

        require(_paintings.length < maxSupply, "Max number of paitings reached!");

        galleryIndex = _galleryIndex;

        for (uint256 i = 0; i < _paintings.length; ++i) {
            mint(
                _paintings[i].name, 
                _paintings[i].posX, 
                _paintings[i].posY, 
                _paintings[i].posZ, 
                _paintings[i].rotX, 
                _paintings[i].rotY, 
                _paintings[i].rotZ, 
                _paintings[i].width, 
                _paintings[i].aspect, 
                _paintings[i].url);
        }


    }

    using Counters for Counters.Counter;
    Counters.Counter private supply;


    mapping (address => Painting []) NFTOwners;


    Painting[] public paintings;

    function getGalleryIndex() public view returns (uint256) {
        return galleryIndex;
    }


    function getPaintings() public view returns (Painting [] memory) {
        return paintings;
    }

    function totalSupply() public view returns (uint256) {
        return supply.current();
    }

    function mint(
        string memory _name, 
        int256 _posX, 
        int256 _posY, 
        int256 _posZ, 
        int256 _rotX,
        int256 _rotY,
        int256 _rotZ,
        uint256 _width,
        uint256 _aspect,
        string memory _url
        ) public onlyOwner {
            require(supply.current() < maxSupply, "Max number of paitings reached!");
            supply.increment();
            _safeMint(msg.sender, supply.current());
            Painting memory _newPainting = Painting(_name, _posX, _posY, _posZ, _rotX, _rotY, _rotZ, _width, _aspect, _url);
            paintings.push(_newPainting);
            NFTOwners[msg.sender].push(_newPainting);
    }


}
