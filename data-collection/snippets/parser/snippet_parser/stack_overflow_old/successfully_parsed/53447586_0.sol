contract Test {
    string public text = 'show me';
    function  test() public view returns (string) {
        return text;
    }
}
