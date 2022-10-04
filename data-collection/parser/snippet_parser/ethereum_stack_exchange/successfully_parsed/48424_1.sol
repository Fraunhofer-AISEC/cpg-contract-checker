pragma solidity 0.4.23; 

contract RFID {

    struct StateStruct {
        bytes32 description;
        mapping(bytes32 => bytes32) sub_state;
    }

    struct ObjectStruct {
        StateStruct state;
        address owner; 
        bool isObject;

        bytes32 review;
    }

    mapping(bytes32 => ObjectStruct) objectStructs;
    bytes32[] public objectList;

    event LogNewObject(address sender, bytes32 indexed id, bytes32 sub_states_types, bytes32 sub_states_values, address owner);
    event LogChangeObjectState(address sender, bytes32 indexed id, bytes32 sub_states_types, bytes32 sub_states_values);
    event LogChangeObjectOwner(address sender, bytes32 indexed id, address newOwner);

    event LogNewObjectReview(address sender, bytes32 indexed _id, bytes32 _review,  address _owner);
    event LogChangeObjectStateReview(address sender, bytes32 indexed id, bytes32 _review);

    function isObject(bytes32 _id) public view returns(bool isIndeed) {
        return objectStructs[_id].isObject;
    }

    function getObjectCount() public view returns(uint count) {
        return objectList.length;
    }

    

    function newObject(bytes32 _id, uint256 number_of_sub_states, bytes32[10] sub_states_types, bytes32[10] sub_states_values, address _owner) public returns(bool success) {
        require(!isObject(_id));

        uint256 counter=0;
        for(counter; counter < number_of_sub_states; counter++) {

            objectStructs[_id].state.sub_state[sub_states_types[counter]] = sub_states_values[counter];

            emit LogNewObject(msg.sender, _id, bytes32(sub_states_types[counter]), bytes32(sub_states_values[counter]), _owner);

        }

        objectStructs[_id].owner = _owner;
        objectStructs[_id].isObject = true;

        objectList.push(_id);

        return true;
    }

    function newObjectReview(bytes32 _id, bytes32 _review,  address _owner) public returns(bool success) {
        require(!isObject(_id));

        objectStructs[_id].owner = _owner;
        objectStructs[_id].isObject = true;

        objectStructs[_id].review = _review;

        emit LogNewObjectReview(msg.sender, _id, _review, _owner);

        objectList.push(_id);

        return true;
    }

    function changeObjectState(bytes32 _id, uint256 number_of_sub_states, bytes32[10] sub_states_types, bytes32[10] sub_states_values) public returns(bool success) {
        require(isObject(_id));
        uint256 counter=0;
        for(counter; counter < number_of_sub_states; counter++) {

            objectStructs[_id].state.sub_state[sub_states_types[counter]] = sub_states_values[counter];

            emit LogChangeObjectState(msg.sender, _id, bytes32(sub_states_types[counter]), bytes32(sub_states_values[counter]));

        }

        return true;
    }

    function changeObjectStateReview(bytes32 _id, bytes32 _review) public returns(bool success) {
        require(isObject(_id));

        objectStructs[_id].review = _review;

        emit LogChangeObjectStateReview(msg.sender, _id, _review);

        return true;
    }

    function changeObjectOwner(bytes32 _id, address _newOwner) public returns(bool success) {
        require(isObject(_id));
        objectStructs[_id].owner = _newOwner;
        emit LogChangeObjectOwner(msg.sender, _id, _newOwner);
        return true;
    }

}
