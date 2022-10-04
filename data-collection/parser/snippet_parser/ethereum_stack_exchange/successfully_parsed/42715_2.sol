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


function createRequest(string description, uint value, address recipient) public restricted {
        Request newRequest = Request({
           description: description,
           value: value,
           recipient: recipient,
           complete: false
        });

        requests.push(newRequest);
    }
}
