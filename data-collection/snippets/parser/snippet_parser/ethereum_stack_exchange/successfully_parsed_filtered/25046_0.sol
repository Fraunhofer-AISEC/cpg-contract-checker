contract A{
   address public owner;

   function A(){
       owner = msg.sender;
   }

   function doSomething(){
       
   }
}

contract B is A{

   function doSomething(){
       require(msg.sender == owner);
       
       super.doSomething();
   }

}
