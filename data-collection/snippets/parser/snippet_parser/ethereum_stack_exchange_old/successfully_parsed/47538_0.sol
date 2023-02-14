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
        }

        mapping(bytes32 => ObjectStruct) objectStructs;
        bytes32[] public objectList;
        

        event LogNewObject(address sender, bytes32 id, bytes32 sub_states_types, bytes32 sub_states_values, address owner);
        event LogChangeObjectState(address sender, bytes32 uid, bytes32 newState);
        event LogChangeObjectOwner(address sender, bytes32 uid, address newOwner);

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

                emit LogNewObject(msg.sender, _id, sub_states_types[counter], bytes32(sub_states_values[counter]), _owner);

            }

            objectStructs[_id].owner = _owner;
            objectStructs[_id].isObject = true;

            objectList.push(_id);

            return true;
        }

        function changeObjectState(bytes32 _id, bytes32 _newState) public returns(bool success) {
            require(isObject(_id));
            
            objectStructs[_id].state = StateStruct(_newState);
            emit LogChangeObjectState(msg.sender, _id, _newState);
            return true;
        }

        function changeObjectOwner(bytes32 _uid, address _newOwner) public returns(bool success) {
            require(isObject(_uid));
            objectStructs[_uid].owner = _newOwner;
            emit LogChangeObjectOwner(msg.sender, _uid, _newOwner);
            return true;
        }

    }
