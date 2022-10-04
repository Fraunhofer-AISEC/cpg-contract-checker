 function proposeNumber () public payable {
           uint temp;
           require(msg.value > .01 ether);
           
            bytes memory b = msg.data;
            for(uint i=0;i<b.length;i++){
            temp = temp + uint(b[i])*(2**(8*(b.length-(i+1))));
            }
            proposals.push(temp);
         }
