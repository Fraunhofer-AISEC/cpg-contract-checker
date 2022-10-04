
pragma solidity 0.8.4;

contract A {

string[] private arr = ['a','b','c'];

function showIDX(uint _IDX) public view returns(string memory)
    {
    return arr[_IDX];
    }

function delegateUpdateIDX(address _contractB, uint _IDX) external returns(bool _success)
    {
    (bool b,)=_contractB.delegatecall( abi.encodeWithSignature("updateIDX(uint _IDX)", _IDX) );
    return b;
    }
  
  
}



contract B {
    
string[] private arr;

function updateIDX(uint _IDX) external
    {
    arr[_IDX]='X';
    }
    
}
