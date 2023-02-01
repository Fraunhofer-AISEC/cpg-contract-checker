pragma solidity ^ 0.5.2;

contract ApprovalContract
{
    address public sender;
    address public receiver;
    address public constant approver = 0x6af7A9CFe4D4B938Ff4038Fd0625d18C5D671834;


function deposit(address payable _receiver) external payable{
    require(msg.value>0);
    sender = msg.sender;
    receiver = _receiver;
    }

    function viewApprover() external pure   returns(address)
        {
            return(approver);
        }

    function approve() external {
        require(msg.sender ==  approver);
        receiver.transfer(address(this).balance);
    }
}
