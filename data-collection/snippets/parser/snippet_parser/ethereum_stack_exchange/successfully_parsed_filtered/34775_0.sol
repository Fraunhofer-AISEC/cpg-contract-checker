pragma solidity ^0.4.19;

contract Token {

    event Transfer(address indexed _from, address indexed _to, uint _value);

    struct Balance {
        uint amount;
        uint lastUpdated;
    }

    mapping (address => Balance) public balances;


    function _transfer(address _from, address _to, uint _amount) internal returns (bool success) {

            
            require(balances[_from].amount >= _amount);
            
            require(balances[_to].amount + _amount > balances[_to].amount);

            balances[_from].amount -= _amount;
            balances[_to].amount += _amount;

            Transfer(_from, _to, _amount);
            return true;
        }
}
