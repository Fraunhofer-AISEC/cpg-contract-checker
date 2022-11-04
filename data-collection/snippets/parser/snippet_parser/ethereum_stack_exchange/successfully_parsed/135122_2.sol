
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestWithdraw is ERC721, Ownable {
    uint256 private _tax_rate = 1;
    address private _tax_man = 0xf9DEB97CcA539576CD582A785465eB9088f36696;


    constructor() ERC721('assetName', 'asset') 
    {
    }
    function recieve_money() public payable {

    }

    function withdraw() external onlyOwner {
        uint tax = (address(this).balance * tax_rate) / 100;
        payable(_tax_man).transfer(tax);
        payable(msg.sender).transfer(address(this).balance);    
    }

}
