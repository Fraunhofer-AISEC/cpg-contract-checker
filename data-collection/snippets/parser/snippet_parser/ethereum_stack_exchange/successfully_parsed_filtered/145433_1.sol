
pragma solidity ^0.8.19;

contract Example {
    struct Coding {
        string code;
        string display;
        string system;
    }

    Coding public data_types_Code = Coding({
        code: "code",
        display: "code",
        system: "http://hl7.org/fhir/data-types"
    });
}
