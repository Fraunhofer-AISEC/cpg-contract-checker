contract Unique {

    string sm;
    string bm;
    bytes32 val;
    bytes32 vm;

    function hk(string s, string y, bytes32 i)returns (bytes32){
        sm =s;
        bm =y;
        vm =i;
        val = sha3(sm,bm,vm);
    }

    function getOut()constant returns (bytes32){
        return val;
    }
}
