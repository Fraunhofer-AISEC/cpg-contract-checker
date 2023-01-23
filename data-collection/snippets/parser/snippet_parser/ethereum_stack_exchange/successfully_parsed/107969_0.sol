
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
    function withdraw() payable external {
        require(msg.sender == owner);
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }
}
contract newETH{
    acceptETH internal acceth;
    constructor(){
        acceth = new acceptETH();
    }
    
    function Accept() external payable {
        acceth.accept{value: msg.value}();
    }
    function Balance() external view returns(uint256){
        return acceth.retContractBalance();
    }
    function Withdraw() payable external {
        acceth.withdraw();
    }
}
