pragma solidity ^0.4.17;

contract FacultyVoting
{
    mapping(address => bool) private voters;
    uint32[11] private faculties;
    
    event Voted(uint32 faculty);
    event VoteFailed(uint32 faculty);
    
    function vote(uint32 faculty) public
    {
        require(voters[msg.sender]==false,"Вы уже проголосовали");
        require(faculty < 11, "Неверный факультет");
        
        voters[msg.sender] = true;
        ++faculties[faculty];
        emit Voted(faculty);
    }
    
    function AlreadyVoted() public view returns (bool)
    {
        return voters[msg.sender];
    }
    
    function GetVotes() public view returns (uint32[11]){
        return faculties;
    }  
    
     
}
