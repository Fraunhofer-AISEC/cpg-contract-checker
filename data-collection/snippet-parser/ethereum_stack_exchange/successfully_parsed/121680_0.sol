
pragma solidity >=0.4.22 <0.9.0;

interface ILandContract {
    function mint(address to, string memory tokenURI) external;
    function getTokenCount() external view returns(uint256);
}

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MintingContract is ReentrancyGuard, Ownable {

    IERC20 private Token;
    address private _landContractAddress;
    uint256 private _landPrice;
    uint256 public numberOfSold;

    struct ParcelsSold{
        uint x;
        uint y;
    }

    mapping (uint256 => ParcelsSold) coords;
    string[] private _landCoordinates;

    event LandSold(
        uint256 timestamp,
        address buyer,
        uint256 amount
    );

    constructor(address landContractAddress, IERC20 tokenAddress, uint256 initialLandPrice){
        _landContractAddress = landContractAddress;
        Token = tokenAddress;
        _landPrice = initialLandPrice;
        numberOfSold = 0;
    }

    function buyLand(string memory tokenURI, uint x, uint y) public nonReentrant {

        for(uint i=0; i< numberOfSold; i++){
            require(!(coords[i].x == x && coords[i].y == y), "Minting : Parcel Sold Already");
        }
        Token.transferFrom(msg.sender, owner(), _landPrice);
        ILandContract land = ILandContract(_landContractAddress);
        land.mint(msg.sender, tokenURI);
        numberOfSold++;

        uint256 tokenId = land.getTokenCount();

        ParcelsSold memory sold = ParcelsSold(x, y);
        coords[tokenId] = sold;

        emit LandSold(block.timestamp, msg.sender, _landPrice);
    }

}
