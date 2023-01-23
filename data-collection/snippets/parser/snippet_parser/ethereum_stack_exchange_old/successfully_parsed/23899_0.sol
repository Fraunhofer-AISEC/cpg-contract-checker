contract c{
    enum Numbers {zero,one,two,three,four}

    Numbers number;

    function getFirstNumber(){
         number=Numbers.zero; 
         uint num=uint(Numbers.zero);
         string stringNum=string(Numbers.zero);
    }
}
