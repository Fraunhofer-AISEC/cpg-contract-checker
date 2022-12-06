contract testStruct {
    struct stru{
        string[] s;
    }

    stru myStru;

    function add(string s) {
        myStru.s.push(s);
    }

    function getAt(uint256 i) constant returns (string s) {
        s = myStru.s[i];
    }
}
