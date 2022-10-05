contract Crowdfunding {
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
    }

    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    address[] public approvers;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
}