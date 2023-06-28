contract Relay {
    address public proxyDeFi;
    address owner = msg.sender;
    
    modifier isOwner() {
        require(msg.sender == owner, "Forbidden");
        _;
    }

    function update(address newAddress) isOwner public {
        proxyDeFi = newAddress;
    }

    fallback() isOwner external payable {
        proxyDeFi.delegatecall(msg.data);
    }
}
