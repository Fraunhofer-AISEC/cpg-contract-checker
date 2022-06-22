contract Voting {
    bytes32[] public encryptedVotes;
    bytes32[] public candidateList;
    address[] public pollingStationList;
    address public owner;
    function Voting(bytes32[] _candidateList, address[] _pollingStationList) public {
        candidateList = _candidateList;
        pollingStationList = _pollingStationList;
        owner = msg.sender;
    }

    function vote(bytes32 encryptedVote) public {
        encryptedVotes.push(encryptedVote);
    }

    function getEncryptedVotes() view public returns (bytes32[]) {
        return encryptedVotes;
    }
}
