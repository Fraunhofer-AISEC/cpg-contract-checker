uint _amount = 5 ether;
(bool success, ) = msg.sender.call{value: _amount}();
require(success, "payment failed");
emit Paid(msg.sender, _amount);  
