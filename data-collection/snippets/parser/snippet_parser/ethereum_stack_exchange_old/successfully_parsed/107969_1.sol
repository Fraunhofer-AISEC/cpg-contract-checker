
pragma solidity ^0.8.0;
contract acceptETH {
    address public owner;
    uint256 public price;
    mapping(address => uint256) balances;
    constructor (){
        owner = msg.sender;
        price = 2 ether;
    }
    function accept() public payable {
        require(msg.value == price);
        balances[msg.sender] += msg.value;
    }
    function retContractBalance() public view returns(uint256){
        return address(this).balance;
    }
    function withdraw(address _ClaimOwner) external {
        
        (bool success, ) = _ClaimOwner.call{value: address(this).balance}("");
        require(success);
    }
    function getOwner() external view returns(address) {
        return owner;
    }
    function AEaddress() external view returns(address) {
        return address(this);
    }
    function getmsgsender() external view returns(address) {
        return msg.sender;
    }
}
contract newETH{
    acceptETH internal acceth;
    address public owner;
    constructor(){
        acceth = new acceptETH();
        owner = msg.sender;
    }
    
    function Accept() external payable {
        acceth.accept{value: msg.value}();
    }
    function acceptETHBalance() external view returns(uint256){
        return acceth.retContractBalance();
    }
    function newETHBalance() external view returns(uint256){
        return address(this).balance;
    }
    function Withdraw() external {
        acceth.withdraw(msg.sender);
    }
    receive() external payable{
        (bool success, ) = owner.call{value:msg.value}("");
        require(success);
    }
    function accethOwner() external view returns(address) {
        return acceth.getOwner();
    }
    function accethAddress() external view returns(address) {
        return acceth.AEaddress();
    }
    function accethmsgSender() external view returns(address) {
        return acceth.getmsgsender();
    }
    function thisAddress() external view returns(address) {
        return address(this);
    }
}
