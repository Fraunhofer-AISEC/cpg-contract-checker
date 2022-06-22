function formatUrl(uint param1, uint param2) constant returns(string) {
        var parts = new strings.slice[](4);
        parts[0] = "http://someurl.com/?param1=".toSlice();
        parts[3] = uintToString(param1).toSlice();
        parts[1] = "&?param2=".toSlice();
        parts[2] = uintToString(param2).toSlice();

        return "".toSlice().join(parts);
    }
