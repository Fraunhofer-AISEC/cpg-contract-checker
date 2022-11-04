pragma solidity ^0.4.17;

contract CaesarDecryption {
  function decrypt(bytes data, int key) pure public returns (bytes) {
      bytes memory decryptedData = data;

      for (uint i = 0; i < decryptedData.length; i++) {
          decryptedData[i] = decryptByte(decryptedData[i], key);
      }

      return decryptedData;
  }

  function decryptByte(byte b, int k) pure internal returns (byte) {
      uint8 ascii = uint8(b);
      uint8 asciiShift;

      if (ascii >= 65 && ascii <= 90)
        asciiShift = 65;
      else if (ascii >= 97 && ascii <=122)
        asciiShift = 97;

      return byte(((ascii - asciiShift - k + 26) % 26) + asciiShift);
  }
}
