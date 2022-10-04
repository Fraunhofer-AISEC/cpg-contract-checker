    pragma solidity ^0.4.17;

    contract BoostrFactory {
            address[] private deployedBoostrs;

            function createBoostr(string title, string description, uint minimum) public {
                    address newBoostr = new Boostr(title, description, minimum, msg.sender);
                    deployedBoostrs.push(newBoostr);
            }

            function getAllBoostrs() public view returns (address[]) {
                    return deployedBoostrs;
            }
    }

    contract Boostr {
            struct Request {
                    string description;
                    uint value;
                    address recipient;
                    bool complete;
                    mapping(address=>bool) approval;
                    uint approvalCount;
            }

            Request[] public requests;
            address private manager;
            string public title;
            string public description;
            uint public minimumContribution;
            mapping(address=>bool) private supporters;
            mapping(address=>bool) private approvers;
            uint public approversCount;

            modifier managerRestricted() {
                    require(msg.sender == manager);
                    _;
            }

            modifier approverRestricted() {
                    require(approvers[msg.sender]);
                    _;
            }

            constructor(string bstrTitle, string bstrDesription, uint minimum, address creator) public {
                    title = bstrTitle;
                    description = bstrDesription;
                    manager = creator;
                    minimumContribution = minimum;
            }

            function getManager() public view returns (address) {
                    return manager;
            }

            function getApprover(address addr) public view returns (bool) {
                    return approvers[addr];
            }

            function getSupporter(address addr) public view returns (bool) {
                    return supporters[addr];
            }

            function contribute() public payable {
                    if (msg.value > 0) {
                            supporters[msg.sender] = true;
                            if (msg.value > minimumContribution) {
                                    approvers[msg.sender] = true;
                                    approversCount++;
                            }
                    }
            }

            function getSummary() public view returns (string, string, uint, uint, uint, uint, address) {
                    return (
                            title,
                            description,
                            minimumContribution,
                            address(this).balance,
                            requests.length,
                            approversCount,
                            getManager()
                    );
            }

            function getRequestsCount() public view returns (uint) {
                    return requests.length;
            }

            function createRequest(string reqDescription, uint value, address recipient) public managerRestricted {
                    Request memory newRequest = Request ({
                            description: reqDescription,
                            value: value,
                            recipient: recipient,
                            complete: false,
                            approvalCount: 0
                    });
                    requests.push(newRequest);
            }

            function approveRequest(uint index) public {
                    Request storage request = requests[index];
                    require (approvers[msg.sender]);
                    require (!request.approval[msg.sender]);
                    request.approval[msg.sender] = true;
                    request.approvalCount++;
            }

            function finalizeRequest(uint index) public managerRestricted payable {
                    Request storage request = requests[index];
                    require (!request.complete);
                    require (request.approvalCount > approversCount / 2);
                    request.complete = true;
                    request.recipient.transfer(request.value);
            }
    }
