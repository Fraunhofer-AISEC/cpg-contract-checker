
contract MyContract {
    
    address payable[] recipients;
 
    function sendEther(address payable recipient) external payable {
        recipient.transfer(1 ether);
    }
}
