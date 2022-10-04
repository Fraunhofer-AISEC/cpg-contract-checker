contract A {

    mapping(uint => uint) public nbrVotesOnProposal;
    mapping(uint => address) public proposalOwner;
    uint public proposalId;            

 
}

contract B {

    A public a;

    constructor(address _a) {
        a = A(_a);
    }

    
    function addProposal() payable external {
      
        a.nbrVotesOnProposal[proposalId] = 0;
        a.proposalOwner[proposalId] = msg.sender;
        a.proposalId++;
     }
}
