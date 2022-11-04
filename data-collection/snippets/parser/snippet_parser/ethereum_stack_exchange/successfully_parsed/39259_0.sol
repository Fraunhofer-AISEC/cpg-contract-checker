contract A{
     function add2(uint msg) internal returns(uint){
         return num+2;
     }
}


contract B is A{
  function addDefault(uint val) public returns(uint){
       return add2(val);
   }
}
