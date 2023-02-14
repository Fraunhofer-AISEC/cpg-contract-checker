function convertBytes20ToAddress(bytes bytesInput) internal returns (address addressOutput) {
    assembly {
      addressOutput := mload(add(bytesInput,20))
    } 
}
