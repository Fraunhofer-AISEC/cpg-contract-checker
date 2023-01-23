
pragma solidity ^0.7.4;

import './Ownable.sol';

interface wallet {

    function getCut(address _from, address _to, uint _value) external returns(bool success);

    function splitFoundersCut(uint _amount, address Ceo, address Cfo, address Cto) external returns(bool success);
}

interface ERC20 {
    function totalSupply() external view returns(uint supply);

    function balanceOf(address _owner) external view returns(uint balance);

    function transfer(address _to, uint _value) external returns(bool success);

    function transferFrom(address _from, address _to, uint _value) external returns(bool success);

    function approve(address _spender, uint _value) external returns(bool success);

    function allowance(address _owner, address _spender) external view returns(uint remaining);

    function decimals() external view returns(uint digits);
    event Approval(address indexed _owner, address indexed _spender, uint _value);

    function deposit() external payable;

    function withdraw(uint256 wad) external;
}

contract FoundersWallet is Ownable {

    address payable Ceo = 0x471F9361ec8Fc947d371B95e5a5f5820C7A42A1B;
    address payable Cto = 0x471F9361ec8Fc947d371B95e5a5f5820C7A42A1B;
    address payable Cfo = 0x471F9361ec8Fc947d371B95e5a5f5820C7A42A1B;

    uint256 amount = address(this).balance;

    function withdraw() internal returns(bool) {

        if(amount > 0) {
            Ceo.transfer((amount / 40));
            Cto.transfer((amount / 40));
            Cfo.transfer((amount / 20));
        }

        else {
            return false;
        }
    }
}
