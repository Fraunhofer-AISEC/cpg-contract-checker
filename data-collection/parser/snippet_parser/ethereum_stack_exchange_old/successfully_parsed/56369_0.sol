pragma solidity >0.4.23 <0.5.0;

interface IParent {
    function setValue(int v) external;
    function getValue() external view returns (int);                                                         
    function getSender() external view returns (address);
}
