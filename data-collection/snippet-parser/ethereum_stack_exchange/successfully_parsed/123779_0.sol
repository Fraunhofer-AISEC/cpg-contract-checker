

pragma solidity >=0.7.0 <0.9.0;

import "./INToken.sol";
import "./Console.sol";

contract TransferCoin is Console {

    
    address public owner;
    INToken public coin;

    constructor(address _coinAddress) {
        
        owner = msg.sender;
        
        coin = INToken(_coinAddress);
    }

    function trans(address _to, uint256 _amount) public {
        log("_to", _to);
        log("_amount", _amount);
        coin.transfer(_to, _amount);
    }
}
