contract Example {

   Token public myToken;

   
  function Example() {
       myToken = new Token();
  }
}
contract Token {
   function getInt() constant returns(uint) {
       return 1;
   }
}
