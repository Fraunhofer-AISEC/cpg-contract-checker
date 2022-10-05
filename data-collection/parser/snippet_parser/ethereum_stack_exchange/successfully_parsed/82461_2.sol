pragma solidity ^0.6.0;

contract Prova
{
   uint[] public array;

   function prova(uint number) public {
      array.push(number);
   }
}
