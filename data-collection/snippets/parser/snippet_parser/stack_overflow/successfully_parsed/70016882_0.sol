pragma solidity ^0.8.1;

contract CrowdSale{

    address public manager;
    mapping(address=>uint)public Contributor;
    uint public target;
    uint public deadline;
    uint public raisedAmount;
    uint public minContributor;
    uint public noOfContributor;


    struct Request{
        string description;
        address payable recipient;
        uint value;
        bool completed;
        mapping(address=>bool) voted;
        uint noOfVoter;
    }
    mapping(uint=>Request)public Requests;
    uint noOfRequest;
    
    constructor(uint _target , uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline;
        manager = msg.sender;
        minContributor = 100 wei;
    }
    
    function sendEth()public payable{
        require(msg.value >= minContributor ,"The Msg.value Is Less Then The minContributor");
        require(block.timestamp < deadline ,"The Time Is Over To Send The Etherum");
        if(Contributor[msg.sender] == 0){
            noOfContributor++;
        }
        Contributor[msg.sender] = Contributor[msg.sender]+msg.value;
        raisedAmount = raisedAmount + msg.value;
    }

    function getTheBalanceOfContract()public returns(uint){
        return address(this).balance;
    }
    function reFund()public{
        require(block.timestamp > deadline && raisedAmount < target ,"You Are Not Eligable");
        require(Contributor[msg.sender]>0,"You Are Not Contributor");
        address payable user = payable(msg.sender);
        user.transfer(Contributor[msg.sender]);
        Contributor[msg.sender] =0;
    }
    modifier OnlyManager(){
        require(msg.sender == manager ,"You Are Not Manager");
        _;
    }
    function createRequest(string memory _description , address payable _recipnet , uint _value)public OnlyManager{
        require(raisedAmount >= target ,"The Target Is Not Reached");
        Request storage r = Requests[noOfRequest];
        require(r.completed==false,"The Request Is Completed");
        r.description = _description;
        r.recipient=_recipnet;
        r.value = _value;
        r.completed = true;
        noOfRequest++;
    }
    function voting()public{
        require(Requests[noOfRequest].voted[msg.sender]==false,"Ypu Are Already Voted");
        Requests[noOfRequest].noOfVoter++;
        Requests[noOfRequest].voted[msg.sender] = true;
        
    }
    function makePayment(uint _id)public OnlyManager{
        require(raisedAmount >= target,"The raisedAmount is not complete");
        require(Requests[noOfRequest].noOfVoter >  noOfContributor/2 ,"The Critarea are not reached");
        Requests[_id].recipient.transfer(Requests[noOfRequest].value);
    }

}
