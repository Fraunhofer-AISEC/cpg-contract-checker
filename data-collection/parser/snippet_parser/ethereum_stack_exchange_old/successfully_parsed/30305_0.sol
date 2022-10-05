contract SimpleSet {
    
    
    mapping (address => uint) index;

    
    address[] store;

    function SimpleSet() public {
        
        store.push(0x0);
    }

    function addToArray(address who) public {
        if (!inArray(who)) {
            
            index[who] = store.length;
            store.push(who);
        }
    }

    function inArray(address who) public view returns (bool) {
        
        if (who != 0x0 && index[who] > 0) {
            return true;
        }
        return false;
    }

    function getPosition(uint pos) public view returns (address) {
        
        require(pos > 0); 
        return store[pos];
    }
}
