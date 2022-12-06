contract MyToken{

    ...

}

contract playerContract{


    function play (uint256 tokens) public {
        
        if (condition) {
            MyToekn instance = MyToken('address of Mytoken');
            instance.transfer('winner address', ntokens); 
        }
    }


}
