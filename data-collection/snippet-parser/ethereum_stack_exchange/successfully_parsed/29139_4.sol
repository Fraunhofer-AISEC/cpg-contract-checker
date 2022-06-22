function sh(address a, address b, int x,int y) public constant returns (int){
    return int(sha256(a,b,x,y)[0]);
}
