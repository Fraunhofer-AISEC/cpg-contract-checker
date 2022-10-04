
pragma solidity ^0.8.0;

interface linkStandardToken {
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool) ;
    function balanceOf(address _owner) external  returns (uint256) ;
    function transfer(address to, uint tokens) external returns (bool success);
}



contract Uniswap 
{
    using SafeMath for uint256;

    uint public totalLiquidity;
    uint public balance;
    address public owner;
    address public tokenAddress = 0xaFF4481D10270F50f203E0763e2597776068CBc5; 
    linkStandardToken token;
    bool public poolInit = false;
    uint public protocolFees = 30; 
    uint public tempTokenPrice = 0;
    mapping(address => uint) public liquidityBalances;

    constructor() 
    {
        owner = msg.sender;
        token = linkStandardToken(tokenAddress);
    }


    function init(uint _tokenAmount) public payable
    {
        require(totalLiquidity == 0, "Already initialized");
        require(_tokenAmount > 0, "Token amount must be > 0");
        require(msg.value > 0, "Eth amount must be > 0");
        totalLiquidity = totalLiquidity.add(_tokenAmount);
        balance = balance.add(msg.value);
        poolInit = true;
        require(token.transferFrom(msg.sender, address(this), _tokenAmount), "Can't transfer tokens to contract");
        setTokenToEthPrice();
    }

    fallback() payable external{}
    receive() payable external{}

    
    function _swap(uint _amount, uint X , uint Y) public view returns (uint)
    {
        
    }


    function swapEthToToken() public payable 
    {
        
    }

    function swapTokenToEth(uint _tokenAmount) public payable 
    {
                
    }

    function setTokenToEthPrice() public 
    {
       tempTokenPrice =  _swap(1, balance , token.balanceOf(address(this))) ;
    }



    function addLiquidity(uint maxTokens) payable public  returns (uint)
    {
        require(msg.value > 0, "msg.val <= 0");
        require(totalLiquidity > 0, "totalLiquidity <= 0");
        uint tokensBalance = getTokenBalance(address(this));
        uint tokensToAdd = msg.value.mul(tokensBalance)/balance;
        require(tokensToAdd <= maxTokens , "tokensToAdd > maxTokens");
        balance= balance.add(msg.value);

        uint mintedLiquidity = msg.value.mul(totalLiquidity)/balance;
        liquidityBalances[msg.sender] = liquidityBalances[msg.sender].add(mintedLiquidity);
        totalLiquidity = totalLiquidity.add(mintedLiquidity);

        require(linkStandardToken(
            0xaFF4481D10270F50f203E0763e2597776068CBc5)
            .transferFrom(msg.sender, address(this), tokensToAdd));

        return mintedLiquidity;
    }


    function withdraw9(uint256 amount, uint minimumEth, uint minimumTokens) public
    {
        require(liquidityBalances[msg.sender] >= amount, "Liquidity Balance of msg send < amount");
        require(totalLiquidity > 0, "totalLiquidity <= 0");

        uint tokenBalance = getTokenBalance(address(this));
        uint temp = amount.mul(totalLiquidity);
        uint etherToTransfer = temp.div(balance);
        uint temp1 = amount.mul(totalLiquidity);
        uint tokensToTransfer = temp1.div(tokenBalance);

        require(minimumEth < etherToTransfer, "minimumEth >= etherToTransfer");
        require(minimumTokens < tokensToTransfer, "minimumTokens >= tokensToTransfer");

        balance = balance - etherToTransfer;
        totalLiquidity = totalLiquidity.sub(amount);
        liquidityBalances[msg.sender] = liquidityBalances[msg.sender].sub(amount);

        address payable  addr = payable(msg.sender);
        addr.transfer(etherToTransfer);
        require(linkStandardToken(
            0xaFF4481D10270F50f203E0763e2597776068CBc5)
            .transfer(msg.sender, tokensToTransfer), "Token transfer unsuccesful");
    }


}



library SafeMath {
    ....
}