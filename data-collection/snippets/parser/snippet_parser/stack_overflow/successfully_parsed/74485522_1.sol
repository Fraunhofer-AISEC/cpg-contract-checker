contract _Elector {
    address private _wallet;
    VoteType private _vote = VoteType.DID_NOT_VOTED;

    constructor(address wallet, VoteType vote) {
        _wallet = wallet;
        _vote = vote;
    }

    function getInformation() external view returns (address, VoteType) {
        return (_wallet, _vote);
    }
}
