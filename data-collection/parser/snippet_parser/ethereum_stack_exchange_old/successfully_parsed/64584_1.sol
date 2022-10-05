contract Proposal {
        Ballot ballot;
        bool complete;
        uint approveCount;
        uint rejectCount;
        mapping (address => bool) voters;

        constructor() {
            ballot = new Ballot(msg.sender);
        }

        function vote(bool _vote) {
            require(ballot.checkIfContributor(msg.sender));
            require(!voters[msg.sender]);

            voters[msg.sender] = true;
            if (_vote) {
                approveCount++;  
            } else {
                rejectCount++;
            }

        }
}
