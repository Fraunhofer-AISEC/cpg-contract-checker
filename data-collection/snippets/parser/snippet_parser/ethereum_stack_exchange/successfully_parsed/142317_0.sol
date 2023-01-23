pragma solidity >=0.7.6 <0.9.0;

contract converter {

    struct rprices {
        uint256 _epochId;
        uint256[2] _ftsoIndices;
        uint256[2] _prices;
        uint256[2] _random;
    }
    rprices[] public rprice;

    constructor() {
        converter1();
    }

    function converter1()
        public
        returns (
            uint256,
            uint256[2] memory,
            uint256[2] memory,
            uint256[2] memory
        )
    {
        rprice.push(
            rprices(
                2342,
                [
                    2323423445345345345345343423423223234234453453453453453434234232,
                    22342323423445345343453453534534534342342322343545345345345345345323423342342
                ],
                [
                    22342323423445345343453453534534534342342322343545345345345345345323423342342,
                    22342323423445345343453453534534534342342322343545345345345345345323423342342
                ],
                [
                    22342323423445345343453453534534534342342322343545345345345345345323423342342,
                    22342323423445345343453453534534534342342322343545345345345345345323423342342
                ]
            )
        );

        return (
            rprice[2]._epochId,
            rprice[2]._ftsoIndices,
            rprice[2]._prices,
            rprice[2]._random
        );
    }
}
