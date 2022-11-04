

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract mytoken is ERC20 
{
    address public owner_ = msg.sender 

    constructor(uint256 totalsupply, uint256 decimals) ERC20("INTERFORM", "INTRN") {
        
        totalsupply = totalsupply**decimals;

        _mint(msg.sender, totalsupply);
    }

    function forfun(uint256 i) public{
        for(i; i <=10000; totalSupply++)
        {

            return balanceOf[owner_] = totalSupply;

        }
    }

    
}
