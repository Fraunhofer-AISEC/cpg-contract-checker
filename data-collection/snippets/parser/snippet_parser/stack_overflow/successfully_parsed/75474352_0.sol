function createUser(string memory _userId, string memory _fName, string memory _lName, string memory _mobile, string memory _dob, uint256 _age, string memory _nationality, string memory _gender) public {
        if(!chkexisitinguserId(_userId)){
            users[_userId] = User(_fName, _lName, _mobile, _dob, _age,_nationality,_gender);
            noofUser++;
            allUserId[k] = _userId;
            k++;
        }
    }

function getUser(string memory _userId) public view returns (string memory, string memory, string memory, string memory, uint256, string memory, string memory) {
        User memory user = users[_userId];
        return (user.fName, user.lName, user.mobile, user.dob, user.age, user.nationality, user.gender);
    }
