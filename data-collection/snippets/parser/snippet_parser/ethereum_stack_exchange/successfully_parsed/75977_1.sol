    constructor(address parent_, uint24 ID_, int16 max, int16 price_, string memory content, string memory time) public{

        proposer = msg.sender;
        parent = ValuED(parent_);
        ID = ID_;
        max_seeking = max;
        price = price_;
        proposal_content = content;
        creation_time_ = time;
    }
