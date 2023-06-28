contract Test1 is Test2 {

    constructor() Test2() {}
}

contract Test2 
{
    address testVal;
    constructor() 
            {testVal= msg.sender;    } 

   function getMSGSender() view returns ( address) {
     return testVal;
   }
}
