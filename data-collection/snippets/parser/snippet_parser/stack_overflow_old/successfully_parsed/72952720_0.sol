contract Ballot {
    struct list{
        string Pan;
        uint age;
        address Address;
        bool Enrolled;
        bool voted;
    } 
    struct candidate_list{
        string Name;
        address Address;
        uint id;
        bool listed;
    }
    address election_officer;
    string public decimal="0"; 
    uint public totalSupply;
    address public founder;
}
