

pragma solidity 0.8.3;  

library DataTypes {
    struct Test{
        uint256 a;
        uint256 b;
    }
}

contract A {

   mapping(uint => DataTypes.Test) public tests;

   DataTypes.Test variableName;

   function init() public {
       variableName = DataTypes.Test(1, 2);
   }

    function getVariableName() public view returns(DataTypes.Test memory) {
       return variableName;
   }


}
