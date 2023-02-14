Contract A {
   struct Test{
       uint256 a;
       uint256 b;
   }
   mapping(uint => DataTypes.Test) public tests;
   function init(){
       DataTypes.Test storage test = DataTypes.Test(1, 2);
   }
}
