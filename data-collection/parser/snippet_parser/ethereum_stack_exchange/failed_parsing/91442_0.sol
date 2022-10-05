contract Reputation{
   uint[] points;          
}

contract Market is Reputaion{
   functio foo() public{
       points[0]= 1;
       delete points[1];
   }
}
