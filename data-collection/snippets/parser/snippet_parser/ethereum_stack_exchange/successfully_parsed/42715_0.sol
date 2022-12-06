contract Crowdfunding {
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
    }
}