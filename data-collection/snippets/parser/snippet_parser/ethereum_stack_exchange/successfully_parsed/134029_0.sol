
pragma solidity ^0.8.0;
import "AccessControl.sol";   
import "ERC20.sol";           
import "KatoSublime.sol";     
import "KatoSublimeBuy.sol";  
import "KatoSublimeFees.sol"; 

contract Kato is ERC20, AccessControl, KatoSublime, KatoSublimeBuy, KatoSublimeFees {

}
