contract usingProperty{
    struct Property{
        bytes32 name;
        uint id;
        mapping (address => bool) accessStakeholders;
        uint[] rating;
    }

    Property[] public propertyList;

    function addProperty(bytes32 _name, address[] _accessStakeholders, uint _rating) returns(bool success, uint _id){

        _id = propertyList.length++;

        Property prop = propertyList[_id];
        for (uint i = 0 ; i < _accessStakeholders.length ; i++){
          prop.accessStakeholders[_accessStakeholders[i]] = true;
        }

        prop.name = _name;
        prop.id= _id;
        prop.rating.push(_rating);
    }


    function removeProperty(uint _id){
        if (propertyList[_id].length == 0) throw;
    }

}
