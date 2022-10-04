pragma solidity 0.5.1;

contract SolArray{
    uint[] a;

    function getA() constant returns  (uint[] memory){

        a.push(123);
        return a;
    }


}
