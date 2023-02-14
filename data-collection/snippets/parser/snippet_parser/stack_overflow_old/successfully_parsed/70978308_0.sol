pragma solidity >=0.6;
contract purchase{
    address payable public seller;
    address payable public buyer;
    address public shipper;
    uint public bonifico_min;
    uint private refund;
    enum StatusType {Start,Paid,Accepted}
    StatusType public status;

    constructor(address s, uint min){
        seller=payable(msg.sender);
        status = StatusType.Start;
        shipper = s;
        bonifico_min=min;
    }

    function propose_and_pay() public payable{
        require((status==StatusType.Start)&& (msg.value>=bonifico_min));
        require(msg.sender!=seller, "The seller cannot buy from himself!");
        buyer=payable(msg.sender);
        status=StatusType.Paid;

    } 
    function reject() public{ 
        require(msg.sender==seller);
        require(status==StatusType.Paid);
        status = StatusType.Start;
    }
    function accept() public{
        require(msg.sender==seller);
        require(status==StatusType.Paid);
        status = StatusType.Accepted;
    }
    function delivered() public{
        require(status==StatusType.Accepted);
        require(msg.sender==shipper);
        status = StatusType.Start;
        seller.transfer( (address(this)).balance );
    }
    function not_delivered() public{
        require(status==StatusType.Accepted);
        require(msg.sender==shipper);
        status = StatusType.Start;
        buyer.transfer( (address(this)).balance );
    }
}