Example 1:

contract A
{
function someLikeableFunction()internal view returns(uint256){}
}

contract B{
function someDisLikeableFunction()internal returns(address){

A().someLikeableFunction();


}

}

Example 2:

contract Interface_A
{
function someLikeableFunction()external view returns(uint256);
}

contract A is Interface_A {

function someLikeableFunction()external override view returns(uint256){}

}

contract B{
function someDisLikeableFunction()internal returns(address){

Interface_A().someLikeableFunction();

}

}
