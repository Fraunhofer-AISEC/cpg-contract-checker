function reverse(bytes32 pad) pure public returns(bytes memory){
    string memory temp = new string(pad.length);
    bytes memory reversed = bytes(temp);

    for(uint256 i=0; i<pad.length; i++) {
        reversed[pad.length - 1 - i] = pad[i];
    }
    return reversed;
}
