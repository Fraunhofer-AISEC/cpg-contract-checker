function creatMyStruct(bytes32 _id, string memory _str) public
{
    mystruct storage newStruct = mystruct({id: _id, str: _str});
    structs[id] = newStruct;
}
