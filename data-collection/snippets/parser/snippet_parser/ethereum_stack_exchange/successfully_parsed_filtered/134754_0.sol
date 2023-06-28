 function doVote(uint _choice)
        public
        inState(State.Voting)
        returns(bool voted)
    {
        bool found = false;        
        
        if(!voterRegister[msg.sender].voted ){
            voterRegister[msg.sender].voted = true;
            vote memory v;
            v.voterAddress = msg.sender;
            v.choice = _choice;

            
            candidatesRegister[_choice].votes++  ;
            
            votes[totalVote] = v;
            totalVote++;
            found = true;
        }
        return found;        
    }
