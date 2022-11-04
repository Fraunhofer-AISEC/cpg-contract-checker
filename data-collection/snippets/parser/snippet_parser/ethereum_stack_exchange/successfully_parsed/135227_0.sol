
contract Ballot{
    
    
    struct Proposal{
        bytes32 name;
        uint voteCount;
    }

    
    
    function winningProposal() public view returns (Proposal[] memory)
    {
        Proposal[] memory win;
        uint winningVoteCount = 0;
        for(uint i=0;i < proposals.length;i++){
            if(proposals[i].voteCount > winningVoteCount){
                winningVoteCount = proposals[i].voteCount;
            }
        }

        for(uint m=0; m < proposals.length; m++){
            if(winningVoteCount == proposals[m].voteCount){
                
                win.push(proposals[m]);
                
                
            }
        }
        

        return win;
    }
}


