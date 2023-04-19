contract IPStorage {
    mapping(uint => string) private ipAddresses;
    
    function storeIPAddresses(string[] calldata _ips) public {
        require(_ips.length <= 100, "Cannot store more than 100 IP addresses");
        for (uint i = 0; i < _ips.length; i++) {
            ipAddresses[i] = _ips[i];
        }
    }
    
    function getIPAddress(uint _index) public view returns (string memory) {
        return ipAddresses[_index];
    }
}
