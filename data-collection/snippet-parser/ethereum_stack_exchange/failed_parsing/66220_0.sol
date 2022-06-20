contract TestString {
    function stringConcat(string a, string b) public returns (string) {
        bytes memory strA = bytes(a);
        bytes memory strB = bytes(b);

        string memory finalLength = new string(a.lenght + b.lenght);

        bytes memory finalStr = bytes[finalLength];

        uint k = 0;

        for(uint i = 0; i < a.lenght; i++) {
            finalStr[k++] = strA[i];
        }

        for(i = 0; i < b.lenght; i++) {
            finalStr[k++] = strB[i];
        }

        returns string(finalStr);   
    }
}
