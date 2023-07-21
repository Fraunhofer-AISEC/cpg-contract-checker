    function createVote(string memory voteName, string[] 
    memory candidateOption) public returns(string memory){

    require(bytes(voteName).length > 0, "you must set a name for your voting.");
    require(candidateOption.length > 0, "Candidate options cannot be empty.");
    require(candidateVote[voteName].length == 0,"the Vote already existed!");
    
    candidateVote[voteName] = candidateOption;

    require(candidateVote[voteName].length > 0, "something is wrong!");

    return "create vote successful!";
    
}
