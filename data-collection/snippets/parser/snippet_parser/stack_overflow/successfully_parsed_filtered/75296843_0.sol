    
    mapping(address => uint256[]) public phones;
    
    mapping(uint256 => uint256) public balance;

function register(uint256 phone, uint256 Balance) public {
        _mint(msg.sender, phone);
        phones[msg.sender].push(phone);
        balance[phone] = Balance;
    }
     
    function details(address owner) public view returns(uint256[] memory){
        return (phones[owner]);
    }
    
