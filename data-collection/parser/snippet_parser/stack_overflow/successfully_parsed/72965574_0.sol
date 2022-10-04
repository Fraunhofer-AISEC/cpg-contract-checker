contract Simplestorage {
    string data;

    function store(string memory _data) public {
        data = _data;
    }

    function retrieve() public view returns (string memory) {
        return data;
    }
}
