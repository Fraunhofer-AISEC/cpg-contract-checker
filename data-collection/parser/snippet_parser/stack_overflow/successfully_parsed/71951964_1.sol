
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Wallet{
    
    
    address[] public approvers;
    uint public quorum;
    struct Transfer{
        uint id;
        uint amount;
        address payable to;
        uint approval;
        bool sent;
    }
    Transfer[] public transfers;
   
    mapping(address => mapping(uint => bool)) public approvals;
    
    
    constructor(address[] memory _approvers, uint _quorum)public{
        approvers = _approvers;
        quorum = _quorum;
    }

    function getApprovers() external view returns(address[] memory){
        return approvers;
    }
    function getTransfers() external view returns(Transfer[] memory){
        return transfers;
    }
    function createTransfer(uint amount, address payable to) external onlyApprovers(){
        transfers.push(Transfer(
           transfers.length,
            amount,
            to,
            0,
            false
        ));
    }
    function approveTransfer(uint id)external onlyApprovers(){
        require(transfers[id].sent == false,'transfer has already been sent');
        require(approvals[msg.sender][id]== false,'cannot approve transfer twice');

        approvals[msg.sender][id]=true;
        transfers[id].approval++;

        if(transfers[id].approval >= quorum){
            transfers[id].sent = true;
            address payable to = transfers[id].to;
            uint amount = transfers[id].amount;
            to.transfer(amount);
        }

    }
    receive() external payable{}

    modifier onlyApprovers(){
        bool allowed =false;
        for(uint i=0;i<= approvers.length;i++){
            if(approvers[i] == msg.sender){
                allowed =true;
            }
    }
            require(allowed=true,'only approvers can approve');
            _;
        }
    }
