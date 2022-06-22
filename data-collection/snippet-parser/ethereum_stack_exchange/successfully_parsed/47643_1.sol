pragma solidity ^0.4.23;

contract Test {

    mapping ( string => B[] ) A;

    struct B {
        string bdesc;
        bool bstatus;
        C[] clist;
    }

    struct C {
        uint createTime;
        string cdesc;
        bool rstatus;
        string ctype;   
    }

    function rptC(string _aid, string _c) public {
        B[] storage bhist = A[_aid];
        if(bhist.length > 0 && bhist[bhist.length-1].bstatus==false) {
            bhist[bhist.length-1].clist.push(C(now,_c,false,""));
        } else if(bhist[bhist.length-1].bstatus==true) {
            bhist[bhist.length].clist.push(C(now,_c,false,""));
        } else {
            bhist[0].clist.push(C(now,_c,false,""));
        }
    }
}
