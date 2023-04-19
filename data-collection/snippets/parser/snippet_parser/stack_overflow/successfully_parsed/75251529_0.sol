    

pragma solidity >=0.7.0 <0.9.0;

contract Value {
    uint public num; 

    function add(uint _num) external{
        num += _num;
    }

    
    function viewNum() public view returns(uint){
        return(num);
    }
}
