contract AbcDataContract {

EntityA[] public items;
mapping (bytes32 => uint) public mapping1;
mapping (bytes32 => uint[]) public mapping2;
mapping (bytes32 => uint[]) public mapping3;


event Event1(uint id);
event Event2(uint id);


struct EntityA {
    string field1;
    string field2;
    bool field3;
    uint field4;
    Status proposalStatus;
}

enum Status {PROPOSED, VOTED, CONFIRMED}
}