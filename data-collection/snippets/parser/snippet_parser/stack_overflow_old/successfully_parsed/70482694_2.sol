address payable public owner;

function transferEther() external payable {
    
    owner = payable(msg.sender);

    

    
    owner.call{value: msg.value}("");
}