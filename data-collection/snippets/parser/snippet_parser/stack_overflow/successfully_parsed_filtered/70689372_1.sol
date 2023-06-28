
pragma  solidity >=0.7.0 <0.9.0;
contract Test{
    string[] A=["A","B"];
    function fun() public view  returns(string[] memory){
        return A;
}
}
