function setURI(uint256 startIndex, string[] memory listOfIpfsURI)
            public onlyOwner 
    {
           for (index = startIndex; index < listOfIpfsURI.length; index++) {
               _setTokenURI(index, listOfIpfsURI[index-startIndex]);
           }
    }
