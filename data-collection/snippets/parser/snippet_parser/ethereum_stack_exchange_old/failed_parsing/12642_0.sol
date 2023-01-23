contract A(){
    bool public boo = false;
    function bar() public {
        boo = true;
    }
}
contract B(){
    A public myA;
    function setA(address addr){
       myA = A(addr);
    }
    function foo() public {
       myA.bar();
    }
}
