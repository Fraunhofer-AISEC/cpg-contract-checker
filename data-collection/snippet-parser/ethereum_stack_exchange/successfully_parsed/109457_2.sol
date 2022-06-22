function delegate(address to,bytes memory data) public  {
     (bool success, bytes memory result) = to.delegatecall(data);
   
       if (!success) {
       if (result.length < 68) revert();
       assembly {
           result := add(result, 0x04)
        }
       revert(abi.decode(result, (string)));
       }
}
