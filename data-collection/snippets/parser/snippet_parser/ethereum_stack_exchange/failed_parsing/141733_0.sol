import {DataTypes} from "./libraries/DataTypes.sol";

Contract A {
   mapping(uint => DataTypes.Test) public tests;
   function init(){
       DataTypes.Test storage test = DataTypes.Test(1, 2);
   }
}
