function getProduct(uint code) constant returns (bytes32 name, uint votes, address company) {
    name=products[code].name;
    votes=products[code].votes;
    company=products[code].company;
}
