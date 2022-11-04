 function doSomething() view public onlyAdmin
 {
     require(!myOtherContract.isActive());
     
 }
