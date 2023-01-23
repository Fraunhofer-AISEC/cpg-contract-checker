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
