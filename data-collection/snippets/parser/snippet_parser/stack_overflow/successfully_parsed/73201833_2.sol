struct voter {
     uint ID;
     string firstName;
     string lastName;
 }

 contract Poll {
     uint public numVoters;

     event VoterAdded(
         voter newVoter
     );

     function AddVoter(string memory _firstName, string memory _lastName) public returns 
     (voter memory)
     {
         numVoters++;
         voter memory _voter = voter(numVoters, _firstName, _lastName);
         _voter.ID = numVoters;
         _voter.firstName = _firstName;
         _voter.lastName = _lastName;
         emit VoterAdded(_voter);
         return _voter;

     }
} 
