
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

    function withdraw_to_me() public view returns (uint256){
        uint256 balance = address(this).balance;
        uint256 local_tax = 100 - _tax_rate;
        uint256 new_balance = (balance * local_tax) / 100;
        return (new_balance);
    }
    function withdraw_to_taxman() public view returns (uint256){
        uint256 balance = address(this).balance;
        uint256 withdraw_amount = (balance * _tax_rate) / 100;
        return (withdraw_amount);
    }

    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(withdraw_to_me());
        payable(_tax_man).transfer(withdraw_to_taxman());
    }

}
