
contract eXample {

  function eXample{
   .....
  }

  event MyEvent(uint x,uint y,uint z);
  function doSomething{
    .....

   MyEvent(x,y,z);
  }
}


contract contractCaller {
  ....

  eXample instance = eXample(address)
 
  function exampleFunction{
    instance.doSomething
  }
  
  ....
}
