uint8[] memory _build = new uint8[](10);
    _build[0] = 1;
    _build[1] = 5;
    _build[2] = 2;
    _build[3] = 5;
    _build[4] = 3;
    _build[5] = 2;
    _build[6] = 4;
    _build[7] = 2;
    _build[8] = 5;
    _build[9] = 1;
uint8[] memory _input = new uint8[](2);
    _input[0] = 6;
    _input[1] = 1;
uint8[] memory _output = new uint8[](2);
    _output[0] = 7;
    _output[1] = 5;

addType(_build, _input, _output);
