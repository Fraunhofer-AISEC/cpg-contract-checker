pragma solidity ^0.4.11;

contract TestLength {

    event Error(string message, bytes32 input);
    bytes32[] allInputs;

    function test(bytes32 input) {

        if (!validateLength(input, 9 , 9)) {
            Error("minimum 9 characters", input);
        }

        allInputs.push(input);
    }

    function validateLength(bytes32 b, uint minLength, uint maxLength) 
    constant internal returns (bool) {

      for (uint i = 0; i < 32; i++) {
        if (i < minLength) {
          if(b[i] == 0) return false;
        }
        if (i > maxLength - 1) {
          if(b[i] != 0) return false;  
        }
      }

      return true;
    }
}
