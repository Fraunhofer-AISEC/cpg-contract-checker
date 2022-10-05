
pragma solidity >=0.7.0 <0.9.0;

contract Ex {
    mapping(address => uint) public balances;
    uint[] public array = [97,98,99];
    function addBalance(address _key,uint newBalance) public {
        balances[_key] = newBalance;
    }

    function deleteBalance(address _key) public {
        delete balances[_key];
    }
    
    function deleteArray(uint _index) public {
       delete array[_index];
    }
}
