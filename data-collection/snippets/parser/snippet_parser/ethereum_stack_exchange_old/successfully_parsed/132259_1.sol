

pragma solidity 0.8.14;

contract CommonAncestor {
    uint public foo;
}

contract ParentA is CommonAncestor {
    function setFoo(uint val) public virtual {
        foo = val;
    }

    function getFoo() public view virtual returns(uint) {
        return foo;
    }
}

contract ParentB is CommonAncestor {
    function setFoo(uint val) public virtual {
        foo = val;
    }

    function getFoo() public view virtual returns(uint) {
        return foo;
    }    
}

contract Descendant is ParentA, ParentB {
    function setFoo(uint val) public override(ParentA, ParentB) {
        foo = val;
    }

    function getFoo() public view override(ParentA, ParentB) returns(uint) {
        return foo;
    }

    function ASetFoo(uint val) public {
        ParentA.setFoo(val);
    }    

    function BSetFoo(uint val) public {
        ParentB.setFoo(val);
    }

    function AGetFoo() public view returns(uint) {
        return ParentA.getFoo();
    }

    function BGetFoo() public view returns(uint) {
        return ParentB.getFoo();
    }
}
