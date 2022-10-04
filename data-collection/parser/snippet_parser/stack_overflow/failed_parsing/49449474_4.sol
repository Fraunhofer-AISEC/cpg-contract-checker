interface A {
    function getMyVariable() view public returns(uint);
}

function setMyVariable(uint _newVar) public onlyOwner {
    A a = A([CONTRACT A ADDRESS HERE])
    a.setMyVariable(_newVar);
}
