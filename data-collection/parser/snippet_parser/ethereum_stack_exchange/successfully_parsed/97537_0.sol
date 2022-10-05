pragma solidity >0.7.0 <0.8.0;

contract  PushTest{

    uint[] array;
    
    function push ( uint amount) external {
        
        array.push(amount);
    }
}
