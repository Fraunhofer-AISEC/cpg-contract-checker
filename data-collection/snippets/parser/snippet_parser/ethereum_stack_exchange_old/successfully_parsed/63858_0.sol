contract InsuranceClaim{
    struct Request {
        address payable insuranceRecipient;
        string personName;
        uint value;
        address payable hospitalRecipient;
        bool complete;

    }
    Request[] public requests;
    address public claimer;

    constructor (address creator) public{
        claimer = creator;
    }

    modifier restricted(){
        require(msg.sender==claimer);
        _;
    }

    function createRequest(string memory personName,address payable insuranceRecipient,uint value,address payable hospitalRecipient) public restricted{
        Request memory newRequest = Request({
            insuranceRecipient:insuranceRecipient,
            value:value,
            personName:personName,
            hospitalRecipient:hospitalRecipient,
            complete:false
        });
        requests.push(newRequest);
    }

    function finalizeRequest (uint index) public payable restricted{
        Request storage request = requests[index];
        require(!request.complete);
        request.hospitalRecipient.transfer(request.value);
        request.complete = true;
    }
}
