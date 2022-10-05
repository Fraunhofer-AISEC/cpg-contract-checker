pragma solidity >=0.5.0 <0.8.0;
contract AddService{
   uint private _count;
   mapping(address=>bool) private _adders;
   function addByOne() public {
      require(_adders[msg.sender] == false, "You have added already");
      
      _count++;
      
      AdderInterface adder = AdderInterface(msg.sender);
      adder.notify();
      
      _adders[msg.sender] = true;
   }
}

contract AdderInterface{
   function notify() public;
}

contract BadAdder is AdderInterface{
   AddService private _addService = 
   uint private _calls;
   
   function notify() public{
      if(_calls > 5){
         return;
      }
      _calls++;
      
      _addService.addByOne();
   }
   function doAdd() public{
      _addService.addByOne();
   }
}
