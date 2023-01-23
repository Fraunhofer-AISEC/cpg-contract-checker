contract testfunction {

    string public converted;

    function stringFloatToUnsigned(string _s) payable {
        bytes memory _new_s;
        uint k = 0;

        for (uint i = 0; i < bytes(_s).length; i++) {
            if (bytes(_s)[i] == '.') { continue; }

            _new_s[k] = bytes(_s)[i];
            k++;
        }

        converted = string(_new_s);
    }
}
