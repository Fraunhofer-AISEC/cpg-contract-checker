 address[] authorized; 
       function verify (address adrs) internal view returns (bool)
{
    bool exist;
    uint  j=authorized.length;
    uint i =0;
    exist = false;
    address[] memory adrss;
    while (i<j){
        uint x =0;
        if (adrss ==address[i]){
            bool = true;
        }
        i++;
    }
    return exist;
}



  modifie allowed (address adrs){
        require  (  verify(adrs)==true);
                    _; }
