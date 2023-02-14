contract A{

      function f1() pure public  returns(uint) { 
       return 1;
    }

      function f2() pure private returns(uint) { 
       return 2;
    } 
     
    function f3() pure internal returns(uint){   
        return 3;
    }

    function f4() pure external returns(uint){ 
        return 4;
    }
}

contract B is A{ 
   
     uint bx = f3();  
}


