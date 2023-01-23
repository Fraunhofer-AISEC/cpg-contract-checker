
pragma solidity >=0.4.22 <0.9.0;

contract Election {
    struct Candidate {
        uint256 candidate_ID;
        string candidate_name;
        string party_name;
        uint16 voteCount;
    }

    uint256 candidate_count;

    mapping(uint256 => Candidate) public candidates;

    function candidate_creation(string memory c_name, string memory c_pname)
        public
    {
        uint256 c_ID = candidate_count++;
        candidates[c_ID] = Candidate(c_ID, c_name, c_pname, 0);
    }

    function get_candidate_details(uint256 c_ID)
        public
        view
        returns (
            string memory,
            string memory,
            uint256
        )
    {
        return (
            candidates[c_ID].candidate_name,
            candidates[c_ID].party_name,
            candidates[c_ID].voteCount
        );
    }
}
