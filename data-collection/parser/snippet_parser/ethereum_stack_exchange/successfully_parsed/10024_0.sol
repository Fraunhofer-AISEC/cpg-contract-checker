contract Unique {

string fn;
string ln;
bytes20  val;
bytes32 sId;

function identify(string s, string y, bytes32 i)returns (bytes20){
    fn =s;
    ln =y;
    sId =i;
    val = keccak256(sm,bm,vm);
}

function getOut()constant returns (bytes20 ){
    return val;
}
}    
