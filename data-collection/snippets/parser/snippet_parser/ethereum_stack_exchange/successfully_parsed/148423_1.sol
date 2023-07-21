string[5] public data;

constructor () {
    data = ["1", "2", "3", "4", "5"];
}

function typepo () public view returns (string[5] memory) {
    return data;
}

