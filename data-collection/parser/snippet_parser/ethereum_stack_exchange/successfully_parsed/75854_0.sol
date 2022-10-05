      function getByInternalDocNo(string memory creator,string memory docNo,string memory typeOfFilter) public view returns(lineItem[] memory,vatDetails[] memory){
        uint count = 0;
        
        for (uint index = 0;index<lineItems[creator].length;index++){
            if(keccak256(bytes(lineItems[creator][index].idNo))==keccak256(bytes(docNo))) {
                count++;
            }
        }
        lineItem[] memory res1 = new lineItem[](count+1);
        vatDetails[] memory res2 = new vatDetails[](count+1);
        count = 0;
        for (uint index = 0;index<lineItems[creator].length;index++){
            if(keccak256(bytes(lineItems[creator][index].idNo))==keccak256(bytes(docNo))) {
                res1[count] = lineItems[creator][index];
                res2[count] = vatDetail[creator][index];
                count++;
            }
        }
        return (res1,res2);
    }
