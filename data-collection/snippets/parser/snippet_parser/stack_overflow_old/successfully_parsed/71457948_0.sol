    function createVote(string memory _title , string[] memory _elements) public {
        Vote storage v;

        for(uint i = 0; i < _elements.length; i++)
            v.differentVotes[i] = Vote_element(_elements[i], 0); 
            
        v.title = _title;          
        v.creator = msg.sender;    
        v.done = false;            
        
        all_votes.push(v);         
    }
