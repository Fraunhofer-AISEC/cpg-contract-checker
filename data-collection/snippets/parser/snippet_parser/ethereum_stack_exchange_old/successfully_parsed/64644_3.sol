function get() external view returns (uint[] memory ages, uint[] memory ids, bytes32[] names) {

    ages = new uint[](customers.length);
    ids = new address[](customers.length);
    names = new bytes32[](customers.length);

    for(uint i = 0; i<customers.length;i++) {
        ages[i] = customers[i].age;
        ids[i] = customers[i].id;
        names[i] = customers[i].name;
    }
}
