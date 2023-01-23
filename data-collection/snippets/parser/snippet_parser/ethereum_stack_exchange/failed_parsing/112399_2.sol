mapping (address => bool) private _locks;

modifier nonReentrant {
require(_locks[msg.sender] != true, "ReentrancyGuard: reentrant call");

_locks[msg.sender] = true;

_;

_locks[msg.sender] = false;
}

function myFunction(...) public nonReentrant {
   
}
