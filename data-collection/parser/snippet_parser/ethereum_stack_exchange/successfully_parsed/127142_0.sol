contract x {

   function y() external
   {
      
      if (some_condition) {
        another_contract_address.call(abi.encodeWithSignature("another_contract_func()"));
      }
   }

}
