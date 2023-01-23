function getdeployedcontracts () public returns (string, uint,uint,uint,uint,uint,address,address) {



     Request storage request= contracts [index];

    return (request.d,
            request.valuev,
            request.r,
            request.t,
            request.n,
            request.r,
            request.recipient);
     index+= 1;

 }
