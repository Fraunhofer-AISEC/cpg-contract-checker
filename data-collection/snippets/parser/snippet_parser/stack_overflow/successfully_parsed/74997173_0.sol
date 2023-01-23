contract minter {

    
    ERC20 erc20 = ERC20 (0x2C31Db3Cc686CBf0EF2325a468f622137A42Da31);

    
    ERC20 [] public tokenList;


    mapping (address => uint) balances;

    
    address owner_ = msg.sender;

    function createERC20 (string memory name_, string memory symbol_, uint totalSupply_) public {
        erc20 = new ERC20 (name_, symbol_, totalSupply_, owner_);
        tokenList.push(erc20);
    }

    
    
    function getList () public view returns (address [] memory){
        return tokenList();



    }
}
