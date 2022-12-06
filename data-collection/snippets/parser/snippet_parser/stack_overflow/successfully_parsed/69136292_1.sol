
 
pragma solidity ^0.8.0;
 
 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
 
contract Test is Ownable {
 
    uint public max_supply; 
 
     function SetMaxSupply(uint amount) public onlyOwner { 
       max_supply = amount;
   }
 
    function current_supply() public view returns(uint) {
        return max_supply * 3;
    }
 
}
