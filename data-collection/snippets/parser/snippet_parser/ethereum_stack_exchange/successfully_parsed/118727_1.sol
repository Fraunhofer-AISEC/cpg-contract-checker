pragma solidity >=0.4.21 <0.7.0;

contract Test {


 constructor (
    address _DEMO,
    address _principle,
    address _treasury,
    address _DAO,
    address _bondCalculator
) public {
    require(_DEMO != address(0));
    address DEMO = _DEMO;
    require(_principle != address(0));
    address principle = _principle;
    require(_treasury != address(0));
    address treasury = _treasury;
    require(_DAO != address(0));
    address DAO = _DAO;
    
    address bondCalculator = _bondCalculator;
    bool isLiquidityBond = (_bondCalculator != address(0));
}
}