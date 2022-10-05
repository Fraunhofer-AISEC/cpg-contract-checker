contract Test {
    struct Bobject {
        address owner;
        uint amount;
    }
    struct Dobject {
        uint id;
        uint ddate;
        string label;
        uint quantity;
        mapping(uint => Bobject) bobjs;
        uint bCount;
    }
    uint public dCount = 0;
    mapping(uint => Dobject) public dobjs;

    function getBobj( uint did, uint bid) external view returns(Bobject memory) {
        return dobjs[did].bobjs[bid];
    }   
}
