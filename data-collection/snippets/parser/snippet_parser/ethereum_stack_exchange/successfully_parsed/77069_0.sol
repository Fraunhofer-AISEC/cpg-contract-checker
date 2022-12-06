pragma solidity ^0.4.20;

contract TestBytes32ToString{
    function bytes32ToString(bytes32 x) public pure returns(uint,uint,uint,string memory){
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for(uint i = 0; i < 32; i++){
            byte char = byte(bytes32(uint(x)*2**(8*i)));
            if(char != 0){
                  bytesString[charCount] = char;
                  charCount++;
            }
        }

        bytes memory bytesStringTrimmed = new bytes(charCount);
        for(i = 0; i < charCount; i++){
            bytesStringTrimmed[i] = bytesString[i];
        }
        return (uint(x),uint(x)*2**(8*0),uint(x)*2**(8*1),string(bytesStringTrimmed));
    }
}
