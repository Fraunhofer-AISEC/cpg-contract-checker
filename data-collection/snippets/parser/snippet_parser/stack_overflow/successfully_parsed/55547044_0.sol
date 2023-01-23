pragma solidity <=0.5.7;
contract MultiSigWallet{
    address payable private owner;
    address payable private  beneficiary;
    uint private minApprovers ;
    uint private currentApprovals;
    mapping(address => bool) approvedBy;
    mapping(address =>bool) isApprover;
    uint public contractBalance;

    constructor  (address payable _beneficiary, address [] memory  _approvers, int32 _minApprovers) public payable{
        require(_approvers.length > 0 && _minApprovers > 0,"At least one approver is required!");
        require(_approvers.length >= minApprovers,"Number of minimum approvers cannot be more than total approvers count");
        owner   = msg.sender;
        beneficiary = _beneficiary;
        for(uint i = 0;i<_approvers.length;i++){
            isApprover[_approvers[i]]= true;
        }

    }

    function approve () public{
        require(isApprover[msg.sender],"Not an Approver");
        if(!approvedBy[msg.sender]){
         approvedBy[msg.sender] = true;
         currentApprovals++;
        }
        if(currentApprovals== minApprovers){
            beneficiary.send(address(this).balance);
            selfdestruct(owner);
        }
    }

    function getContractBalance () public payable returns( uint){
       contractBalance =  address(this).balance;
    }
    function reject() public {
        require(isApprover[msg.sender],"Not an approver!");
        selfdestruct(owner);
    }


}
