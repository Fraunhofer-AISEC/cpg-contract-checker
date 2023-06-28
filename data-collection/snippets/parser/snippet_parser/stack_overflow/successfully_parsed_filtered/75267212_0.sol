contract SompleContract{
    string favWord;
    uint favNum;

    function simpleFunction(uint _favNum, string memory _favWord) public {
        favNum = _favNum;
        favWord = _favWord;
    }

}
