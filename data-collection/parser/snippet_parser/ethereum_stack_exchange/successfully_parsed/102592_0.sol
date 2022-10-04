mapping(uint256 => Data) CheckAttribute;
 struct Data{
        uint256 AttributeID;
        string attribute;
        string approve;
    }
function checkAttribute(uint256 AttributeID, string memory attribute, string memory approve) public returns (bool success){
        CheckAttribute[AttributeID] = Data(AttributeID, attribute, approve);
        return true;
}
