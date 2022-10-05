pragma solidity ^0.8.0;


  
contract test {
 
    mapping (address => uint[]) MyMap;

    constructor(){
        MyMap[msg.sender].push(0);
        MyMap[msg.sender].push(1);
        MyMap[msg.sender].push(2);
        MyMap[msg.sender].push(3);
    }

    
    MyMap[msg.sender][2] = MyMap[msg.sender][MyMap[msg.sender].length - 1];
    
    MyMap[msg.sender].pop(); 

}
