interface Contract1Interface
{
    function myfunction(uint) external returns (uint);
}

contract Contract2   
{
   event log(string msg);

   Contract1Interface c = Contract1Interface(0x...deploymentadress_of_contract1);
   uint ret;
   bytes public data;

   function test1() public
   {
      
      try c.myfunction(param) {  } catch {  }
   }
   
   function test2() public
   {  
     bool success;
     (success, data) = address(c).call{value: 0 ether}(abi.encodeWithSignature("myfunction(uint)", 5));

     if (success) {
         emit log("ok");
     } else {
         emit log("nok");
     } 
   }
   
   function test3() public
   {
     bool success;
     (success, data) = address(c).call(abi.encodeWithSignature("myfunction(uint)", 6));

     if (success) {
         emit log("ok");
     } else {
         emit log("nok");
     } 
   }
