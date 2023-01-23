
import "@openzeppelin/contracts/utils/Strings.sol";
pragma solidity ^0.8.14;

contract voting{
    address admin;
    constructor(){
        admin = msg.sender;
    }
    struct candidate{
        string can_name;
        address can_add;
        uint256 votes;
    }
    struct _candidate{
        string can_name;
        address can_add;
    }

    address[] voters;
    mapping(uint => candidate) private all_candidates;
    mapping(uint => _candidate) _all_candidates;

    uint can_count = 0;

    modifier Admin {
        require(msg.sender == admin, "You dont have access to this feature.");
        _;
    }

    function isAdded(address _addr) private view returns(bool) {
        candidate memory temp;
        for(uint i=0;i<can_count;i++){
            temp = all_candidates[i]; 
            if(temp.can_add == _addr){
                return true;
            }
        }
        return false;   
    }

    function add_candidate(string memory _name, address _addr) public Admin {
        require(!isAdded(_addr), "Address already added !");
        candidate memory temp;
        _candidate memory temp2;
        temp.can_name = _name;
        temp2.can_name = _name;
        temp.can_add = _addr;
        temp2.can_add = _addr;
        all_candidates[can_count] = temp;
        _all_candidates[can_count] = temp2;
        can_count++;
    }

    function Announce_Winner() public view Admin returns(string memory _winner) {
        require(can_count >= 2, "Add atleast 2 candidates!");
        uint max_votes=0;
        candidate memory temp2;
        candidate memory winner;
        for(uint i=0;i<can_count;i++){
            temp2 = all_candidates[i]; 
            if(temp2.votes > max_votes){
                max_votes = temp2.votes;
                winner = temp2;
            }
        }
        string memory winnerstr = "winner is: ";
        winnerstr = string.concat(winnerstr, winner.can_name);
        winnerstr = string.concat(winnerstr, " with votes: ");
        winnerstr = string.concat(winnerstr, Strings.toString(winner.votes));
        winnerstr = string.concat(winnerstr, " has address: ");
        winnerstr = string.concat(winnerstr, Strings.toHexString(uint256(uint160(winner.can_add)), 20));
        
        return winnerstr;
    }

    function showCandidates() public view returns(string memory) {
        string memory temp = "";
        for(uint i=0; i<can_count; i++){
            temp = string.concat(temp, Strings.toString(i));
            temp = string.concat(temp, ": ");
            temp = string.concat(temp, _all_candidates[i].can_name);
            temp = string.concat(temp, "    ");
        }
        return temp;
    }

    function isVotingSelf(address _addr, uint index) private view returns(bool) {
        if(all_candidates[index].can_add == _addr){
            return true;
        }else{
            return false;
        }
    }

    function isVotingAgain(address _addr) private view returns(bool) {
        for(uint i = 0; i<= voters.length; i++){
            if(voters[i] == _addr){
                return true;
            }
        }
        return false;
    } 

    function vote(uint256 indexOfCandidate) public {
        require(!isVotingSelf(msg.sender, indexOfCandidate), "You cant vote yourself.");
        require(!isVotingAgain(msg.sender), "You already voted.");
        all_candidates[indexOfCandidate].votes++;
        voters.push(msg.sender);
    }
}
