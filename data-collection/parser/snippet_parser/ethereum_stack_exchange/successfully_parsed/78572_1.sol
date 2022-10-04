pragma solidity >=0.5.0 <0.7.0;

contract Base1 {
    function foo() virtual public {}
}

contract Base2 {
    function foo() virtual public {}
}

contract Inherited is Base1, Base2 {
    
    
    function foo() public override(Base1, Base2) {}
}
