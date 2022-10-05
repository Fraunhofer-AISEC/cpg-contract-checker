
pragma solidity ^0.8.4;
interface ERC20{
    function totalSupply() external view returns (uint256);
    function deposit() external payable;
    function withdraw(uint wad) external;
    function approve(address guy, uint wad) external returns (bool);
    function transfer(address dst, uint wad) external returns (bool);
    function transferFrom(address src, address dst, uint wad) external returns (bool);
}

contract swapper{
    ERC20 weth;
    constructor(address _weth){
        weth = ERC20(_weth);
    }

    function getWeth() external payable{
        weth.deposit{value : msg.value}();
        weth.transfer(msg.sender,msg.value);
    }

    function totalSupply() view public returns(uint256){
        return weth.totalSupply();
    }

    function getEth(uint256 wad) external payable{
        weth.transferFrom(msg.sender, address(this) , wad);
        weth.withdraw(wad);
        payable(msg.sender).transfer(address(this).balance);
    }

    function approveIt (uint256 wad) public{
        weth.approve(address(this),wad);
    }

    function balance() public view returns(uint256){
        return address(this).balance;
    }


}
