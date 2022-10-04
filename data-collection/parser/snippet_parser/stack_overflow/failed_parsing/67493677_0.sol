    function getPropertyByid(string memory _propertyId)private view returns(PropertyObj memory){
    for(uint i = 0; i<PropertyArray.length; i++){
        if (keccak256(bytes((PropertyArray[i].id))) == keccak256(bytes((_propertyId)))) {
            return PropertyArray[i];
        }
        return null;
    }
}
