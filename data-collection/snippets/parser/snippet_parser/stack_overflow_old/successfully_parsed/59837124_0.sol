   
   function SetSomethingInAnotherContract_WithoutCall() public
   {
       anotherContract.SetSomething(4);
   }

   
   function SetSomethingInAnotherContract_WithCall() public
   {
       uint temp = anotherContract.GetSomething(); 
       anotherContract.SetSomething(4);
   }
