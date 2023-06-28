contract FractionTokenTest is Test {
    FractionToken fractionToken;

function setUp() public virtual {
        
        ChugSplash chugsplash = new ChugSplash();

        
        string memory chugsplashFilePath = "./chugsplash/hello-chugsplash.json";

        
        chugsplash.deploy(chugsplashFilePath, true);

        
        chugsplash.refresh();

        fractionToken = FractionToken(
            payable(
                chugsplash.getAddress(chugsplashFilePath, "<MY SC REFERENCE NAME>")
            )
        );
    }
}

