pragma solidity ^0.4.22;
import "github.com/provable-things/ethereum-api/provableAPI_0.4.25.sol";

contract T2Contract is usingProvable {
    string public ETHUSD;

    constructor() public  {
    }
    
    function __callback(string result) public {
        if (msg.sender != provable_cbAddress()) revert();
        ETHUSD = result;
    }
    
    function updatePrice() public  {
        
        provable_query("WolframAlpha", "random number between 0 and 100");
    }
    
    function updatePricePayable() public  payable {
        
        provable_query("WolframAlpha", "temperature in london");
    }
}
