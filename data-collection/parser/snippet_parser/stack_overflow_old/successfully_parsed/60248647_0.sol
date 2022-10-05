pragma solidity 0.6.2;

contract Caller {

   address cont;

   function changeAdd(address _change) public {
     cont = _change;
   }

   function caller (bytes memory test) public returns(bool, bytes memory) {
      bytes memory payload = abi.encodeWithSignature("callMe(bytes)", test);
      (bool success, bytes memory result)= address(cont).call(payload);
      return (success, (result));

   }

   function viewCont() public view returns(address) {
       return cont;
   }  
}
