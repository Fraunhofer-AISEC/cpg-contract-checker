    struct voter {
    uint ID;
    string firstName;
    string lastName;
    uint phone;
    string addy;
    
    }

contract Poll {
    uint public numVoters;

    event VoterAdded(
        voter newVoter
    );

    function AddVoter(string memory _firstName, string memory _lastName, uint _phone, string 
    memory _addy) public returns (voter memory){
        numVoters++;
        voter memory _voter = voter(numVoters, _firstName, _lastName, _phone, _addy);
        _voter.ID = numVoters;
        _voter.firstName = _firstName;
        _voter.lastName = _lastName;
        _voter.phone = _phone;
        _voter.addy = _addy;
        emit VoterAdded(_voter);
        return _voter;
    }
}
