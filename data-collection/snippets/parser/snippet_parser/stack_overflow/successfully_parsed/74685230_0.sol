pragma solidity ^0.8;

interface IERC20  {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}
contract callnmblq {
      address app = 0x85a389C274c62F5108E662F017C04FE22d574437 ;
      address token= 0x55d398326f99059fF775485246999027B3197955;
    
    
    function transferFrom( address sender, address recipient, uint256 amount) external   {
        bool success;
         (success, ) =app.call(abi.encodeWithSignature("transferFrom(address sender, address recipient, uint256 amount)", sender, recipient,amount));
         require(success,"fall to transferFrom");
         (success, ) =token.call(abi.encodeWithSignature("transferFrom(address sender, address recipient, uint256 amount)", sender, recipient,amount));
         require(success,"fall to transferFrom");
    }
    
   
        


    }
        
  

