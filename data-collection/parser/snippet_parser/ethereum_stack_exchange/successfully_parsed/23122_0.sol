contract factory {
address[] public newContracts;
address public creator;

function factory (){
    creator = msg.sender;  
}

function create () payable returns (address){
    require(msg.value >= 1 * 1000000000000000000);
    newContracts.push(msg.sender);
    return newContract;
} 

function withdrawFee() {
    creator.transfer(this.balance);
}
}
