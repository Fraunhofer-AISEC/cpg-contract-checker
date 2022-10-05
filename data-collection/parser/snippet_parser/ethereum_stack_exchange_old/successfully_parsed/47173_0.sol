pragma solidity ^0.4.17;
contract TightPack {
    
    uint[] a;
    uint[] c;

    
    function pack(uint[] b) public{
        uint l = b.length;
        delete a;

        
        for(uint i=0;i<l/256;i++){

            uint j = i * 256;
            uint temp = b[j] << 255;
            
           
            for(j=j + 1;j < i * 256 + 256;j++){
                temp = (b[j] << (255 - (j%256))) | temp;
            }
            a.push(temp);
        }
        
        if (l%256 > 0){
           uint k= (l/256)*256;
            uint val = (b[k] << 255);
            for(k=k+1; k < l;k++){
                val = (b[k] << (255 - (k%256))) | val;
            }
            a.push(val); 
        }

    }

    function unpack() public {
        uint l = a.length;
        delete c;
        
        for(uint i = 0;i < l;i++){
            uint temp = a[i];
            
            for(uint j=0;j < 256;j++){
                c.push(temp >> (255 - j) & 1);
            }
        }
    }

    function get_packed() public view returns(uint[]){
        return a;
    }

    function get_unpacked() public view returns(uint[]){
        return c;
    }

}
