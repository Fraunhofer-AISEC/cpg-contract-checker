function bytesToUint(bytes b) public pure returns (uint){
    uint number;

    for(uint i=0;i<b.length;i++){
        number = number + uint(b[b.length-1-i])*(10**i);
    }

    return number;
}
