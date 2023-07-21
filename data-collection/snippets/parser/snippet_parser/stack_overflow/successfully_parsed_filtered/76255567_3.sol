interface IContractA {
    struct Person {
        string name;
    }
    function person(uint256 _index) external view returns (Person memory);
}
