pragma solidity ^0.4.21;

contract PayMultiple {
    using SafeMath for uint;

    function pay(address[] payees, uint[] values) public payable{
         
         require(payees.length == values.length);

         
        uint total = 0;
        for(uint i = 0; i < payees.length; i++){
            total = total.add(values[i]);
        }
        require(total == msg.value);

        
        for(i = 0; i < payees.length; i++){
            payees[i].transfer(values[i]);
        }
    }
}
