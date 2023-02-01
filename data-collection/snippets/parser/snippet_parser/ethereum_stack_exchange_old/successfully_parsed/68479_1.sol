function valuereturn() view public returns(uint){
    for(uint n=0;n<myStructs.length;n++){
        myStructs storage f = MyStruct[n];
        return (f.field2);
    }
}
