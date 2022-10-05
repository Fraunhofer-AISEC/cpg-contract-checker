function extractTimes (bytes data) public pure returns(uint256) {
    uint256 number;
    for(uint i= 0;i< 32;i++){
        number = number + uint(data[12 + i])*(2**(8*(32-(i+1))));
    }

    return number;
}
