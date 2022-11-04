    function getAllData()public view returns(People[] memory){
        uint256 count = (countArr.length);
        uint256 i = 0;
        People[] memory outputL= new People[](count);
        while(count >= 0){
            (string memory nam,uint256 num) = getPerson(count-1);
            People memory temp = People(nam,num);
            outputL[i]=temp;
            count--;
            i++;
        }
        return outputL;
    }                
}
