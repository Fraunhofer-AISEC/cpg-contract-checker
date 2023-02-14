contract Concatenator {
    address[]  Accounts1;
    function ConcatenateArrays(address[] Accounts2){
        uint i = 0;
        while (i++ < Accounts2.length) {
            Accounts1.push(Accounts2[i]);
        }
    } 
}
