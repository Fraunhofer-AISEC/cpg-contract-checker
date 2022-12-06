struct Proposal{
    uint32 id;
    string text;
    bytes docs;
    bool selected;
    uint expectedBudget;
    address submitter;
}





Proposal proposal = Proposal({
                      id:getId(),
                      text:_text,
                      docs:<what_should_I_use_here>,
                      selected:false,
                      expectedBudget:_expectedBudget,
                      submitter: msg.sender
                    })
