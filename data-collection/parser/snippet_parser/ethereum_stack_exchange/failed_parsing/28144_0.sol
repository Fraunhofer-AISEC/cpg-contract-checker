pragma solidity ^0.4.0;


contract MyToken {
    

     mapping (address => uint) public _balanceOf;
     mapping (address => uint) public _expiryOf;

     uint leasePeriod = 100;
     uint price = 1 Ether;

     
     modifier expiry(address _addr) {
         if (_balanceOf[_addr] > 0 && _expiryOf[_addr] < block.timestamp) {
             _expiryOf[_addr] = 0;
             _balanceOf[_addr] = 0;
         }
         _;
     }

     function lease(uint _amount) 
        public
        payable
        expiry(msg.sender)
        returns (bool) {
        require(1 Ether == msg.value); 
        require(0 == _balanceOf[msg.sender]); 
        _expiryOf[msg.sender] = block.timestamp + leasePeriod;
        _balanceOf[msg.sender] += 1; 
    }

    function balanceOf(address _addr) 
        public
        expiry(_addr)
        returns (uint) {
        return _balanceOf[_addr];
    }
}
