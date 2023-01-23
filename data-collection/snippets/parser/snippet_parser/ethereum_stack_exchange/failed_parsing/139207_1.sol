bytes memory stringNumber = bytes(_str);
    assembly
    {
        
        function power(level,num) -> result
        {
            let i:=0x1
            result := num
            if gt(level,0)
            {
                for {} lt(i,level) {}
                {
                    result := mul(result,num)
                    i:=add(i,0x1)
                }
            }
            if eq(level,0)
            {
                result := 0x1
            }
            
        }

        let lengthStr := mload(stringNumber) 
        let data := mload(add(stringNumber,0x20))  
        let temp
        
        let  level10 
        for {let i:=0 } 
            lt(i,lengthStr)
            {i := add(i,0x1)}
            {
                temp := sub(data, 0x30) 
                if or(lt(temp,0x0),gt(temp,0x9))
                {
                    res := 0x0
                    stop()
                }
                level10 := power(sub(sub(lengthStr,i),0x1)  ,0xA) 
                res := add(res, mul(temp,level10))
                data := mload(add(stringNumber,i)))  
            }
       

    }
