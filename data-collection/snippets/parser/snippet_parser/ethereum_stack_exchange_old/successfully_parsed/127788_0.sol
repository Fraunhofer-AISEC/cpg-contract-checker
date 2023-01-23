
pragma solidity >0.6.0 < 0.9.0 ;
contract xyz {
    uint256 public abc ;
    struct lmnop {
        uint256  abc;
        string name;
    }
    lmnop [] public qwerty ;
    

function store (uint256 _abc) public 
{
    abc =_abc ;
    
}
function retrieve () public view returns (uint256)
{
    return abc ;
}
function addqwerty (string memory _name, uint256 _abc) public {
 lmnop.push(lmnop({abc:_abc, name:_name})) ;
}
}
