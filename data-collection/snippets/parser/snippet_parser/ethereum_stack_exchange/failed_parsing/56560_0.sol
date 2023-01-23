contract  A{
    uint 256 a;
    function set(uint _a){ 
           require(a > 100);
           a = _a;

    }

}

contract B{
   function callA(){
   A a = A(the_addr_of_A);
   a.set(100);
   }
}
