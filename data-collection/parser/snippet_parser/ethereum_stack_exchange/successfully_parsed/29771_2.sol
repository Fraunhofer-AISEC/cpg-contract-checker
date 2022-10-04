pragma solidity ^0.4.9;

contract ERC20 { 
   function tokenExchangeRate() returns(uint); 
}

contract TokenBalance {

    function getBalance(address tokenAddress) view returns (uint){

        ERC20 t = ERC20(tokenAddress); 
        uint bal = t.tokenExchangeRate();

        return bal;
    }
}
