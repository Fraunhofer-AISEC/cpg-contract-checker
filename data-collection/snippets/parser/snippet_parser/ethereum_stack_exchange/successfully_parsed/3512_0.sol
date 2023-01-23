contract testStruct {
    struct stru{
        string[] s;
    }

    stru myStru;

    

    function add(string s) {
        string[] memory strAr; 
        strAr[0] = s;
        myStru = stru(strAr);
    }

    function getFirst(uint i) constant returns (string s) {
        s = myStru.s[0];
    }
}
