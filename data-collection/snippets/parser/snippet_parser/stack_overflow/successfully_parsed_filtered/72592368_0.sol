contract master{

 uint  p;
    function changep()public {
p=1;
}
function getP()public returns(uint){
return p;
}
}


contract CallerOne is master {
function change1()public{
    changep();
}
function Get1() public returns(uint){
    return getP();
}

}
contract CallerTwo is master{
function change2()public{
    changep();
}
function Get2() public returns(uint){
    return getP();
}
}
