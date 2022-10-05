    
    pragma solidity ^0.8.11;

    import "@chainlink/contracts/src/v0.8/ERC677Token.sol";
    import {StandardToken as linkStandardToken} from 
    "@chainlink/contracts/src/v0.8/vendor/StandardToken.sol";

    contract LinkToken is linkStandardToken, ERC677Token {
        uint256 public constant totalSupply = 10**27;
        string public constant name = "ChainLink Token";
        uint8 public constant decimals = 18;
        string public constant symbol = "LINK";

        function LinkToken() public {
            balances[msg.sender] = totalSupply;
        }
}