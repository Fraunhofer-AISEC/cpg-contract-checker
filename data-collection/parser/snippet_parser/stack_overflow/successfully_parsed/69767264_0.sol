pragma solidity >=0.7.0 <0.9.0;

abstract contract IUSDT{
    function approve(address _spender, uint _value) virtual external returns (bool);
    function transferFrom(address _from, address _to, uint _value) virtual public;
    function transfer(address recipient, uint256 amount) virtual external returns (bool);
}

contract usdtTransfer{
    IUSDT TetherContract;
    
    function transferUSDT(uint256 amount) public {
        TetherContract.transfer(address(this),amount);
    }
    
    constructor(address _tetherAddress){
        TetherContract=IUSDT(_tetherAddress);
    }
}
