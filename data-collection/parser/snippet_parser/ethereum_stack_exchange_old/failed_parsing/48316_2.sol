Contract MyContract{

    address public owner;
    constructor(){
        owner = msg.sender;
    } 

    function transferToOwner() payable returns (bool) {
        require(msg.value == 1 ether,"Amount should be equal to 1 Ether");
        owner.transfer(1 ether);
        return true;
    }

}
