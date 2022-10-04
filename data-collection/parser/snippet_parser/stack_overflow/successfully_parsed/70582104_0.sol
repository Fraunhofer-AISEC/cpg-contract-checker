struct PERSON {
        uint256 id;
        string name;

    }

PERSON public personList;

function updateNewPerson(uint256 _index, string memory _name) public {
        PERSON memory newUpdatedPerson;
        newUpdatedPerson.name = _name;
        personList[_index] = newUpdatedPerson;
    }
