abstract contract AbstractCandidate {
    uint private _number;
    string private _avatar;

    constructor(uint number, string memory avatar) {
        _number = number;
        _avatar = avatar;
    }

    function getInformation() external view returns(Candidate memory) {
        return Candidate({ avatar: _avatar, number: _number });
    }
}
