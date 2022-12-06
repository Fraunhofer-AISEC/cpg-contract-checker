interface Icontract {
    function myFunction() public returns (bool);
}

contract MyContract is Icontract {
    function myFuntion public returns (bool) {
        return true;
    }
}
