contract Crowdfunding {
    struct Request {
       string description;
       uint value;
       address recipient;
       bool complete;
     }

    address public manager;
    uint public minimumContribution;
    address[] public approvers;

    function Crowdfunding(uint minimum) public {
        manager = msg.sender;
        minimumContribution = minimum;
    }
}
