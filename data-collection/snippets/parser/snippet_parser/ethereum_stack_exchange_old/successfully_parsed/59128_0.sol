function converIntToString(uint number) internal view returns(string){

    if (number == 0) 
        return "0";
    uint j = number;
    uint length;
    while (j != 0){
        length++;
        j /= 10;
    }

    bytes memory bstr = new bytes(length);
    uint k = length - 1;
    while (number != 0){
        bstr[k--] = byte(48 + number % 10);
        number /= 10;
    }

    return string(bstr);

}
