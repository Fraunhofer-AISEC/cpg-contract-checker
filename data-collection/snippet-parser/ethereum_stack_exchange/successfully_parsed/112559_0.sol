struct MyStruct {   
   uint num;
   uint num2;
}


function setNewVar() public {
   MyStruct storage x = SomeLib.getX();  
   x.num3 = 42;   
}

