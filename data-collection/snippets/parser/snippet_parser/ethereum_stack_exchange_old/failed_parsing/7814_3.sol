contract MyInterface {
    modifier contractOnly(){
        address contractAddress = this;
        if(msg.sender != contractAddress) throw; _
    }
    function transfer(address from, address to, uint amount) contractOnly returns (uint);
}

contract TheContract is MyInterface {
    function transfer(address from, address to, uint amount) contractOnly returns (uint) {
        ...
    }

    function thisWillWork(address from, address to, uint amount) {
        MyInterface(address(this)).transfer(from, to, amount);
    }

    function thisWillFail(address from, address to, uint amount) {
        transfer(from, to, amount);
    }
}
