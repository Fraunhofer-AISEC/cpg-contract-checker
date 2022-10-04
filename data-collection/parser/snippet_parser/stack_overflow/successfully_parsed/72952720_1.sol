
pragma solidity >=0.4.22 <0.9.0;

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

contract Ballot {
    address election_officer;
    string public decimal="0"; 
    uint public totalSupply;
    address public founder;
}

