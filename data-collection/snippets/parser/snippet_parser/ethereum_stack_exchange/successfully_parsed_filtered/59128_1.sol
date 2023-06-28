function convertIntToString(uint256 _number) 
internal 
pure 
returns (string) {
    uint256 _tmpN = _number;

    if (_tmpN == 0) {
        return "0";
    } 

    uint256 j = _tmpN;
    uint256 length = 0;

    while (j != 0){
        length++;
        j /= 10;
    }

    bytes memory bstr = new bytes(length);

    uint256 k = length - 1;

    while (_tmpN != 0) {
        bstr[k--] = byte(48 + _tmpN % 10);
        _tmpN /= 10;
    }

    return string(bstr);

}
