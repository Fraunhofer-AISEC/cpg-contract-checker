 function addVote(string memory voteName, string memory candidate, address addr) public returns(string memory){

        require(candidateVote[voteName].length > 0, "Vote does not exist.");
        
        require(!voters[voteName][addr], "Address has already voted!");

        voteCount[voteName][candidate]++;
        

        voters[voteName][addr] = true;
        
        return "Vote successful casted!";
    }
