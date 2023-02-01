pragma solidity 0.8.7;

contract example {

function exampleFunction(bytes memory params){

    
    (address[] memory array0, uint numberExample, address[] memory array1) = abi.decode(params, (address[], uint, address[]));
    
    

  }
}
