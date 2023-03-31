pragma solidity ^0.8;

contract Parent {
    function foo() virtual public pure returns (uint) {
        return 1;
    }
}

contract Child is Parent {
    
    function foo() override public pure returns (uint) {
        return 2;
    }
}

contract Child2 is Parent {
    
    function foo() override public pure returns (uint) {
        uint returnedFromParent = super.foo();

        
        return returnedFromParent + 1;
    }
}
