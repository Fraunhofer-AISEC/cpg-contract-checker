contract MyContract{
   uint a = 0;

   function myFunction() public {
      a = 0;
   }

   function increaseVariable() public {
       a++;
       if (a == 10) {
           myFunction();
       }
   }
}
