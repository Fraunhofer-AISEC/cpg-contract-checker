
contract ONE {

    address payable public  owner;

    constructor()  payable   {
        owner=payable(msg.sender);
    }

    receive () external payable {}

function sendViaCall(address payable _to ) payable external  {

        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
        
    }

function GetBalance() public view returns (uint) {
    return address(this).balance;
}

}