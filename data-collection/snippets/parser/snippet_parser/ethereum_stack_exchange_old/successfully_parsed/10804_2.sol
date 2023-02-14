pragma solidity ^0.4.2;
contract UintToStr {  
     function UintToString(uint v) constant returns (string) {
          bytes32 ret;
            if (v == 0) {
                 ret = '0';
            }
            else {
                 while (v > 0) {
                      ret = bytes32(uint(ret) / (2 ** 8));
                      ret |= bytes32(((v % 10) + 48) * 2 ** (8 * 31));
                      v /= 10;
                 }
            }

            bytes memory bytesString = new bytes(32);
            for (uint j=0; j<32; j++) {
                 byte char = byte(bytes32(uint(ret) * 2 ** (8 * j)));
                 if (char != 0) {
                      bytesString[j] = char;
                 }
            }

            return string(bytesString);
      }
}
