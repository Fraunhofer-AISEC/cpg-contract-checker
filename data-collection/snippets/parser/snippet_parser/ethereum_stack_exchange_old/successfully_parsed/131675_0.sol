
pragma solidity ^0.8.0;

contract BlockTest2{

     function test2() public view returns(bytes32 b46,uint number45){
         number45 = block.number; 
         b46=blockhash(number45);   
    }
}
