contract C { 
string a;
string b;
bytes32 d;

function identify(string sm, string bm, bytes32 i) returns (bytes32 hash){
    a = sm;
    b =bm;
    d = i;
    return sha3(sm, bm, i);
}

}
