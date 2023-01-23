function addStrings(string calldata _valueZero, string calldata _valueOne) public {
    bytes memory byteValueZero = bytes(_valueZero);
    bytes memory byteValueOne = bytes(_valueOne);
    
    if (byteValueZero > byteValueOne) {
        
    } else if (byteValueZero < byteValueOne) {
        
    } else {
        revert("You must enter two different values");
    }
}
