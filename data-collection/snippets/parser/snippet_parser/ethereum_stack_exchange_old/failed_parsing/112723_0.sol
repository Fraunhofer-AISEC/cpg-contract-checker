Contract MyContract {
   function parent(){
    assembly{
     let ptr := some_pointer_hex_val
     mstore(some_pointer_hex_val, myPersistedVal)
     pop(call(...call a function in the external contract))
  } 
 }

  function callback(){
   let myVal := mload(some_pointer_hex_val)
   ...do something with myVal (where myVal = myPersistedVal)
  }
}
