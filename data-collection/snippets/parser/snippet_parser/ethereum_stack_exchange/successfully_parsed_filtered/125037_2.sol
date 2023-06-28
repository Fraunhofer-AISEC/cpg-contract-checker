contract ArrayTest
{
    string[5] public listOne = ['AAA','BBB','CCC','DDD','EEE'];
    string[5] public listTwo = ['AAA','BBB','DDD','FFF','GGG'];

    mapping (string => bool) listOneContains;
    mapping (string => bool) listTwoContains;

    
    string[] public output1;
    
    string[] public output2;
    
    string[] public output3;

    constructor(){
        for(uint256 i = 0;i<listOne.length;){
            listOneContains[listOne[i]] = true;
            listTwoContains[listTwo[i]] = true;
            unchecked{
                i++;
            }
        }

        for(uint256 i = 0;i<listOne.length;){
            if(!listOneContains[listTwo[i]]){
                output1.push(listTwo[i]);
            }
            if(listOneContains[listTwo[i]]){
                output2.push(listTwo[i]);
            }
            if(!listTwoContains[listOne[i]]){
                output3.push(listOne[i]);
            }
            unchecked{
                i++;
            }
        }

    }
}
