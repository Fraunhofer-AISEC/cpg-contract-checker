

pragma solidity ^0.8.3;

contract Storage {
    struct People {
        uint256 personId;
        string vorname;
        string nachname;
        uint256 birthdate;
    }

    struct Decision {
        string decision;
        string wantdonate;
        string dontwantdonate;
    }

    People[] public people;
    mapping(string => Decision) internal vornameToDonation;
    mapping(string => mapping(string => Decision)) internal nachnameToDonation;
    mapping(uint256 => mapping(string => mapping(string => Decision)))
        public birthdayToDonation;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("NotOwnerError");
        }
        _;
    }

    uint256 public peopleCount = 0;

    function addPerson(
        uint256 _birthdate,
        string memory _vorname,
        string memory _nachname,
        string memory _decision,
        string memory _wantdonate,
        string memory _dontwantdonate
    ) public onlyOwner {
        people.push(People(peopleCount, _vorname, _nachname, _birthdate));
        birthdayToDonation[_birthdate][_nachname][_vorname] = Decision(
            _decision,
            _wantdonate,
            _dontwantdonate
        );
        peopleCount++;
    }

    function readDonation(
        uint256 _birthdate,
        string memory _vorname,
        string memory _nachname
    ) public view onlyOwner returns (Decision memory) {
        Decision memory readOnly = vornameToDonation[type(Storage).name];

        return readOnly;
    }

    function removePerson(uint256 index) external onlyOwner {
        
        if (index == people[index].personId) delete people[index];
        peopleCount--;
    }
}
