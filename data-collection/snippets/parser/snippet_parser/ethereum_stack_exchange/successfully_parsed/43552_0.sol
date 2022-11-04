pragma solidity ^0.4.4;
contract IamHongKongTokenBack_00{ 

  
function SeeMyAddAndETHVar() public constant returns (address, uint) {
    address _myadd = msg.sender;
    return ( _myadd,  _myadd.balance);
}   


function SeeSheEthVar(address _InputAdd) public constant returns (address, uint) {
    address _SheAc = _InputAdd;
    return (_SheAc, _SheAc.balance);
}   


}
