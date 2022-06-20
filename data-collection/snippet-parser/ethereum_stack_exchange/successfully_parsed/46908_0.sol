contract Test{
    int256[] public test;

    function setTest(int256 b) public{
        test.push(b);
    }

    function setTest2(uint256 a, int256 b) public {
        test[a] = b;
    }
}
