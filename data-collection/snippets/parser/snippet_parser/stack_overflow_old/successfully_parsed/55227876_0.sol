contract Test {
    uint256 myNumber = 70;


    function setMyNumber(uint256 _myNumber)
    external {
        myNumber = _myNumber;
    }

    function getMyNumber ()
    external view returns (uint256) {
        return myNumber;
    }

    function return170 ()
    external pure returns (uint256) {
        return 170;
    }

    function returnNumber (uint256 _number)
    external pure returns (uint256) {
        return _number;
    }
}
