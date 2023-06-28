

pragma solidity ^0.8.0;

contract PayMultiple {

function pay(address[] memory payees, uint[] memory values) public payable{
     require(payees.length == values.length);

    uint total = 0;
    for(uint i = 0; i < payees.length; i++){
        total += values[i];
    }
    require(total == msg.value);

    for(uint i = 0; i < payees.length; i++){
        (bool success,) = payable(payees[i]).call{value:values[i]}("");
        require(success,"Not successfull");
    }
}
}