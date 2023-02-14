pragma solidity^0.8.7;

contract baga{

   bytes public name =new bytes (2);
   function  initname (){
     name[0]=0x7a;
     name[1]=0x68;

   }
   function getlength() view public returns (uint){
     return name.length ;
   }
}
