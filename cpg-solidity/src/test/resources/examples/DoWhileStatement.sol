// Solidity program to
// demonstrate the use of
// 'Do-While loop'
pragma solidity ^0.5.0;

// Creating a contract
contract Types {

    // Declaring a dynamic array
    uint[] data;

    // Declaring state variable
    uint8 j = 0;

    // Defining function to demonstrate
    // 'Do-While loop'
    function loop(
    ) public returns(uint[] memory){
    do{
        j++;
        data.push(j);
     }while(j < 5) ;
      return data;
    }
}