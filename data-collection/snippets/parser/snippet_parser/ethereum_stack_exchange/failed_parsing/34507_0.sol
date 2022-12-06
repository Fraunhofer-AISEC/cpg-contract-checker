14     
15     function transfer(address _to, uint256 _amount) returns (bool success) {
16         if (balances[msg.sender] >= _amount 
17             && _amount > 0
18             && balances[_to] + _amount > balances[_to]) {
19             balances[msg.sender] -= _amount;
20             balances[_to] += _amount;
21             return true;
22         } else {
23             return false;
24         }
25     }
