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

    function isObject(bytes32 _id) public view returns(bool isIndeed) {
            return objectStructs[_id].isObject;
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
