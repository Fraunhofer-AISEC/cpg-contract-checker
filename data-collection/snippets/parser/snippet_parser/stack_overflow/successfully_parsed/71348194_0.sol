uint256 public investLength;
    
function A()external{
    uint256 id = investLength++;
    _a(id);
}

function _a(uint256 _Id) internal returns (address) {
   require(_id != 0, 'id zero');
}
