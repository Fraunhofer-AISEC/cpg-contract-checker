function newObject(bytes32 _object_id, bytes32 _state, address _owner) public returns(bool success) {
        require(!isObject(_object_id));

        objectStructs[_object_id].state = _state;
        objectStructs[_object_id].owner = _owner;
        objectStructs[_object_id].isObject = true;
        objectList.push(_object_id);

        LogNewObject(msg.sender, _object_id, _state, _owner);
        return true;
    }

event LogNewObject(address sender, bytes32 _object_id, bytes32 state, address owner);
