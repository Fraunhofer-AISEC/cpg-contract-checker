library AppLib {

    struct AppData {
        address[] foo;
        mapping(address => Bar) bars;
    }

    struct Bar {
        uint a;
        address b;
        mapping(uint => address[]) somethingArrays;
    }

    function storeSomething(
        AppData storage self,
        address foo_,
        address bar_,
        uint a_,
        address b_,
        uint index_,
        address[] calldata somethingAddresses_
    ) internal {
        self.foo.push(foo_);
        Bar storage bar = self.bars[bar_];
        bar.a = a_;
        bar.b = b_;
        bar.somethingArrays[index_] = somethingAddresses_;
    }
}

contract App {

    using AppLib for AppLib.AppData;

    AppLib.AppData app;

    function write(
        address foo_,
        address bar_,
        uint a_,
        address b_,
        uint index_,
        address[] calldata somethingAddresses_        
    ) external {
        app.storeSomething(
            foo_,
            bar_,
            a_,
            b_,
            index_,
            somethingAddresses_
        );
    }
}
