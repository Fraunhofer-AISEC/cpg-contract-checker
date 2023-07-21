function createMakananPart1(
        uint _kodeProduksi,
        string memory _nama,
        string memory _deskripsi,
        uint _berat) public {
            require(bytes(_nama).length > 0);
            require(bytes(_deskripsi).length > 0);
            require(_berat > 0);
            require(_kodeProduksi > 0);
            makananCount++;


            makananPart1s[makananCount] = MakananPart1(
                _kodeProduksi,
                _nama,
                _deskripsi,
                msg.sender,
                _berat
            );

            emit MakananPart1Created(
                _kodeProduksi,
                _nama, 
                _deskripsi, 
                msg.sender, 
                _berat);

            
        }

    function createMakananPart2(
        uint _kodeProduksi,
        uint _harga,
        uint _tglProduksi,
        uint _tglKadaluwarsa,
        string memory _komposisi
    ) public {
        require(_harga > 0);
        require(_tglProduksi > 0);
        require(_tglKadaluwarsa > 0);
        require(bytes(_komposisi).length > 0);
        require(_kodeProduksi > 0);

        

        makananPart2s[makananCount] = MakananPart2(
            _kodeProduksi,
            _harga,
            true,
            _tglProduksi,
            _tglKadaluwarsa,
            false,
            _komposisi
        );

        emit MakananPart2Created(
            _kodeProduksi,
            _harga,
            true,
            _tglProduksi,
            _tglKadaluwarsa,
            false,
            _komposisi
        );
    }
