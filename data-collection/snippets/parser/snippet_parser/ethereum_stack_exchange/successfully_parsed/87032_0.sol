    struct Server{
    
       uint sernum;
       uint num;
       uint data;
    }
    Server [] public datta;


    
    function count() public constant returns(uint sercount) {
        
        return datta.length;
    }
    function set_data (uint Sernum ,uint Num, uint Data  ) public  {
        Server memory xserver = Server(Sernum,Num,Data);
        uint x= count();
        bool y;
        if(x>=1){
            
            for (uint i = 0; i<datta.length;i++){
            
                if(datta[i].sernum == Sernum && datta[i].num==Num && datta[i].data<Data){
                    
                    y=true;
                }
                else{
                    
                    y==false;
                }
            }
            if (y==true){
              
                datta.push(xserver);
      }
   }
}