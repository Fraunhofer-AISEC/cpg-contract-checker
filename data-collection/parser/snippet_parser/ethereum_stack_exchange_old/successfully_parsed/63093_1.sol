    function getHandler(address _ad) view public returns(string,string,address[]){
        return (addressToHandler[_ad]._name,addressToHandler[_ad]._additionalInformation,addressToHandler[_ad]._ownerProducts);
    }
