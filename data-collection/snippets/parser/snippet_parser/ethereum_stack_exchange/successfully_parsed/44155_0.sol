function removeDevice(address owner, string dev_addr)public{
    delete registeredTo[dev_addr];
    for(uint i = 0; i < ownership[owner].length;i++){
        if(keccak256(ownership[owner][i].device_address) == keccak256(dev_addr)){         
            ownership[owner][i] = ownership[owner][ownership[owner].length-1];
            delete postedItems[owner][postedItems[owner].length-1];
            postedItems[owner].length--;
            break;
        }
    }
}
