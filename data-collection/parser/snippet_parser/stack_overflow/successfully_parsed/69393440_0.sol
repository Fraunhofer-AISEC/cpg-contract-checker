contract MyLoopPractice
{
    
    uint []numberList = [1,4,34,56];
    
    function loopinnumber(uint userinput) public view returns(bool)
    {
        bool checker = false;
        for(uint i=0;i<=numberList.length;i++)
        {
            if(numberList[i]==userinput)
            {
                checker = true;
            }
        }
        
        return checker;
        
    }
}