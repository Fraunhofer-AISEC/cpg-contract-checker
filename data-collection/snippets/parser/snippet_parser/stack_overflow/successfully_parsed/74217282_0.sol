function example(address user) public returns(bool){
        
        if(condition1){
            emit Error("ERROR 1");
            return false;
        }

        
        if(condition2){
            emit Error("ERROR 2");
            return false;
        }


        

        return true;
    }
