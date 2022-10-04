pragma solidity 0.4.24;

contract Test2 
{
    address testVal;

    constructor() public {
        testVal= msg.sender;
    } 

   function getMSGSender() public view returns ( address) {
     return testVal;
   }
}

contract Test1 is Test2 {

}
