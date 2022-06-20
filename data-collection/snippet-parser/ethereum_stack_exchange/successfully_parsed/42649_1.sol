pragma solidity ^0.4.20;

contract multiVar {
    struct trial { 
        string s1;
        string s2;
        string s3;
        string s4;
        string s5;
        string s6;
        string s7;
        string s8;
        string s9;
        string s10;
        string s11;
        string s12;
        string s13;

    }
    trial t;

    function myfunc(string t1,
        string t2,
        string t3,
        string t4,
        string t5,
        string t6,
        string t7,
        string t8,
        string t9,
        string t10,
        string t11,
        string t12,
        string t13){
          t = trial(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13);
    }
}
