address public owner;
    mapping(address => uint) public balances;
    uint totalSupply;


function mint(address receiver, uint amount) public {
require(msg.sender == owner);
        
        totalSupply += amount;
        balances[receiver] += amount;
    }

function CheckTotalSupply(uint supply) public {
        returns supply;
    }
