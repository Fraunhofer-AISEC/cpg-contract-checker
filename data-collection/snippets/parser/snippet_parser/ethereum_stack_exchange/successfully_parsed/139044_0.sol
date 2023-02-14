 constructor(
    string memory _name,
    string memory _symbol,
    string memory docHash
) ERC20(_name, _symbol) {
    name = _name;
    addHashes(docHash);
}
