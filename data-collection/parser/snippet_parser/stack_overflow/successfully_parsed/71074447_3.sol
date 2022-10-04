contract test {
    uint public a = 0;

    
    function addRevert() public{
        a += 1;
        goRevert();
    }

    
    function addNoRevert() public{
        a += 1;
    }

    function goRevert() pure public{
        revert();
    }
}
