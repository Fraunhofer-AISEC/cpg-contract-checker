contract pureExample {

    

    function pureComputation(uint para1 , uint para2) public pure returns(uint result) {
        
        result = para1 + para2;
        return  result;
    }

}
