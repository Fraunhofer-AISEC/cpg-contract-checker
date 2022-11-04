contract c {
    struct samplestruct1 {
        string name;
    }
    struct samplestruct2{
        string name;
        mapping (int => samplestruct1) s1s;
    }

    samplestruct2 s2; 

    function setS2Name(string name) {
        s2.name = name;
    }

    function newS1(int key, string name) {
        samplestruct1 memory s1; 
        s1.name = name;
        s2.s1s[key] = s1;
    }
}
