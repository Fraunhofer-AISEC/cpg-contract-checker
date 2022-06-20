contract RootContract {
    Simple public s;
    string public data;
    function RootContract() { s= new Simple();}
    function getSimpleData() constant returns(string out) {
        s.fillData(this);
        out=data;
    }
    function setData(string d) {data=d;}
}

contract Simple  {
    string public data;
    function setData(string d ){data=d;}
    function fillData(RootContract r) public {r.setData(data);}

}
