pragma solidity >=0.4.22 <0.9.0; 


contract Registration {
    struct Child {
        uint256 id;
        string name;
        string placeOfBirth;
        string motherFullname;
        string motherNRC;
        string bo; 
        string gender;
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
        string memory _placeOfBirth,
        string memory _motherFullname,
        string memory _motherNRC,
        string memory _bo,
        string memory _gender,
        string memory _pAddress
    ) public {
        child.push(Child(nextId, _name, _placeOfBirth, _motherFullname, _motherNRC, _bo, _gender, _pAddress));
        nextId++;
    }

    function readRecordById(uint256 _id)
        public
        view
        returns (uint256, string memory, string memory, string memory, 
        string memory, string memory, string memory, string memory)
    {
        uint256 i = find(_id);
        return (
            child[i].id,
            child[i].name,
            child[i].placeOfBirth,
            child[i].motherFullname,
            child[i].motherNRC,
            child[i].bo,
            child[i].gender,
            child[i].pAddress
        );
    }

    function updateRecordById(
        uint256 _id,
        string memory _name,
        string memory _placeOfBirth,
        string memory _motherFullname,
        string memory _motherNRC,
        string memory _bo,
        string memory _gender,
        string memory _pAddress

    ) public {
        uint256 i = find(_id);
        child[i].name = _name;
        child[i].placeOfBirth = _placeOfBirth;
        child[i].motherFullname = _motherFullname;
        child[i].motherNRC = _motherNRC;
        child[i].bo = _bo;
        child[i].gender = _gender;
        child[i].pAddress = _pAddress;
    }

    function deleteRecordById(uint256 _id) public returns (uint256) {
        uint256 i = find(_id);
        delete child[i];
    }
}
