
pragma solidity ^0.8.0;

contract Registration {
    struct Child {
        uint256 id;
        string name;
        string sex;
        uint256 weight;
        string condition;
        string otherConditions;
        uint256 dateOfBirth;
        string placeOfBirth;
        string birthOccurence;
        string motherFullname;
        string motherNrc;
        string contact;
        string pAddress;

    }

    
    Child[] public child;
    uint256 nextId = 1;

    function find(uint256 _id) public view returns (uint256) {
        for (uint256 i; i < child.length; i++) {
            if (child[i].id == _id){ return i;
            }
        }
        revert("Record does not exist.");
    }

    function insertRecord(
        string memory _name,
        string memory _sex,
        uint256 _weight,
        string memory _condition,
        string memory _otherConditions,
        uint256 _dateOfBirth,
        string memory _placeOfBirth,
        string memory _birthOccurence,
        string memory _motherFullname,
        string memory _motherNrc,
        string memory _contact,
        string memory _pAddress
    ) public {
        child.push(Child(nextId, _name, _sex, _weight, _condition, _otherConditions, _dateOfBirth,
         _placeOfBirth, _birthOccurence, _motherFullname, _motherNrc, _contact, _pAddress));
        nextId++;
    }

    function readRecordById(uint256 _id)
        public
        view
        returns (uint256, string memory, string memory, uint256, 
        string memory, string memory, uint256, string memory, string memory,
        string memory, string memory, string memory, string memory)
    {
        uint256 i = find(_id);
        return (
            child[i].id,
            child[i].name,
            child[i].sex,
            child[i].weight,
            child[i].condition,
            child[i].otherConditions,
            child[i].dateOfBirth,
            child[i].placeOfBirth,
            child[i].birthOccurence,
            child[i].motherFullname,
            child[i].motherNrc,
            child[i].contact,
            child[i].pAddress
        );
    }


    function deleteRecordById(uint256 _id) public returns (uint256) {
        uint256 i = find(_id);
        delete child[i];
    }
}
