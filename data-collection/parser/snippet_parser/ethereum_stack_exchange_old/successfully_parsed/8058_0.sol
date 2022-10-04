contract test{
   uint a ;
   function test() {
       a = 1;
   }
   function val() returns(uint){
       return a;
   }  
}

contract test2 is test{ 
    uint b = a++;
    function show() returns(uint){
        return b; 
    }
}
