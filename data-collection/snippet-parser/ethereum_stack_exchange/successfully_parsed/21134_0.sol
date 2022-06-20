pragma solidity ^0.4.4;

contract Test

{
    bool approval=false;
    bytes32 UID;

event update(bytes32 indexed _UID);
event Notification (string notification);



function fireEvent(bytes32 _UID) public
{ 
    UID = _UID;
    update(UID);
}


function getStatus() constant returns(bool)
{
    return approval;
}

function updateStatus(bool approval_UI) returns(bool) 

{

    if (approval_UI)
    {
        Notification("ACCEPTED");
        approval=true;
        return approval;

    }
    else 
    {
        Notification("REJECTED");
        approval=false;
        return approval;
    }
}
}