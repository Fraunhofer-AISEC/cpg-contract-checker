contract Test {
    ...
    mapping (address => string) private _emails;

    function getEmail(address from) public view returns (string memory) {
        require(msg.sender == from, 'No!');
        return _emails[msg.sender];
    }
}
