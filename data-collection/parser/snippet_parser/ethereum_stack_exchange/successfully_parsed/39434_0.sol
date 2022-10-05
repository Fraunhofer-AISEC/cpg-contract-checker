pragma solidity ^0.4.19;

contract Convert {
    function toBinaryString(uint8 n) public pure returns (string) {
        
        require(n < 32);

        bytes memory output = new bytes(5);

        for (uint8 i = 0; i < 5; i++) {
            output[4 - i] = (n % 2 == 1) ? byte("1") : byte("0");
            n /= 2;
        }

        return string(output);
    }

    function fromBinaryString(bytes5 input) public pure returns (uint8) {
        uint8 n = 0;

        for (uint8 i = 0; i < 5; i++) {
            n *= 2;
            if (input[i] == "1") {
                n += 1;
            } else {
                
                require(input[i] == "0");
            }
        }

        return n;
    }
}
