contract Sample {
     string constant statictext = "Hello";
     bytes32 constant statictext1 = "Hello";
    function  getStatictextasString() constant public  returns(string){
        return statictext;
    }

     function  getStatictextasBytes() constant public returns(bytes32){
        return statictext1;
    }
}
