pragma solidity ^0.5.12;

contract testCompound {

    address cethAddress = 0x42a628e0c5F3767930097B34b08dCF77e78e4F2B; 
    address cusdcAddress = 0x43a1363AFB28235720FCbDF0C2dAb7759091F7e0; 

    ERC20 usdc = ERC20(0xFE724a829fdF12F7012365dB98730EEe33742ea2); 
   

    address owner;
    
    CompoundERC20 private cusdcCompound;

    constructor() public {
        owner = msg.sender;
        usdc = ERC20(0xFE724a829fdF12F7012365dB98730EEe33742ea2);
      
        cusdcCompound = CompoundERC20(cusdcAddress);
    }

    function mint(uint256 mintAmount) external returns (bool){
        
        
        cusdcCompound.mint(mintAmount);
        return true;
    }

}

contract CompoundERC20 {
  function approve ( address spender, uint256 amount ) external returns ( bool );
  function mint ( uint256 mintAmount ) external returns ( uint );
}

contract ERC20 {
    function totalSupply() external view returns (uint supply);
    function balanceOf(address _owner) external view returns (uint balance);
    function transfer(address _to, uint _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);
    function approve(address _spender, uint _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint remaining);
    function decimals() external view returns(uint digits);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
