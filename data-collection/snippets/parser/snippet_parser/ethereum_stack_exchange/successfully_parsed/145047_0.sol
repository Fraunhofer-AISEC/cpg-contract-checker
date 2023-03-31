
pragma solidity ^0.8.9;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "antematter/usd.sol";

contract MyNft is ERC721, Ownable {
    uint256 public constant MAX_SUPPLY = 50;
    uint256 public currentSupply;
    uint256 public fee = 10 * (10**18);
    address[] public minters;
    TetherUsd anteMatter;

    constructor() ERC721("MyToken", "MTK") {
        anteMatter = new TetherUsd();
    }

    function safeMint(uint256 tokenId) public {
        anteMatter.mint(msg.sender, fee * 2);
        anteMatter.approve(getAdd(), fee);
        require(currentSupply < MAX_SUPPLY);
        require(anteMatter.balanceOf(msg.sender) > fee, "insufficient usdt");
        if (currentSupply == 0) {
            
            anteMatter.transferFrom(msg.sender, getAdd(), fee);
        }
        _safeMint(msg.sender, tokenId);
        minters.push(msg.sender);
        currentSupply++;
    }

    function getAdd() public view returns (address) {
        return address(this);
    }
}
 

