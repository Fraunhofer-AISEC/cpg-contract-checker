contract Test {

  function concat(string str1, string str2) returns (string){

        bytes memory bs1 = bytes(str1);
        bytes memory bs2 = bytes(str2);

        uint len1 = bs1.length;
        uint len2 = bs2.length;

        string memory temp = new string(len1 + len2);
        bytes memory result = bytes(temp);

        uint index = 0;
        for (uint i = 0; i < len1; i++) {
            result[index++] = bs1[i];

        }
        for (i = 0; i < len2; i++) {
            result[index++] = bs2[i];

        }
        return string(result);
    }

}
