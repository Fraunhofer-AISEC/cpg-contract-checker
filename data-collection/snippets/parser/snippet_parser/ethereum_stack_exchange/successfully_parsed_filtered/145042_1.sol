contract Bar {
    function func(Foo foo) {
        try foo.revertWithError {}
        catch (bytes memory err) {
            
        }
    }
}
