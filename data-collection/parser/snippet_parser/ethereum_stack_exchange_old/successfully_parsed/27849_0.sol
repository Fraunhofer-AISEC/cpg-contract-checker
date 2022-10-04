contract MyContract{

    bytes tempNum ; 
    uint[] numbers;

    function splitStr(string str, string delimiter) constant returns (int []){ 

        bytes memory b = bytes(str); 
        bytes memory delm = bytes(delimiter); 

        for(uint i; i<b.length ; i++){          

            if(b[i] != delm[0]) { 
                tempNum.push(b[i]);             
            }
            else { 
                numbers.push(parseInt(string(tempNum))); 
                tempNum = "";   
            }                
        }

        if(b[b.length-1] != delm[0]) { 
           numbers.push(parseInt(string(tempNum)));
        }
        return numbers;
    }
}
