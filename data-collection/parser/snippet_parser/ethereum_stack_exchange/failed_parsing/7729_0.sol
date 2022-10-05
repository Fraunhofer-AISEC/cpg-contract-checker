struct samplestruct1 {
    string name;
}
struct samplestruct2{
    string name;
    mapping (int => samplestruct1) s1s;
}

function createSampleStruct2(string name) {
    samplestruct2 s2;
    s2.name = name;
    ...
}
