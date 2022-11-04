contract UseCase {

    LibraryA libA = LibraryA(0x1234123412341234123412341234123412341234);
    LibraryB libB = LibraryB(0x0012341234123412341234123412341234123412);

    enum Type { Magic, MoreMagic }

    function checkToken(Type type) public returns (address) {
        if (type == Type.Magic) {
            return libA.getSenderAddress();
        } else {
            return libB.getSenderAddress();
        }
    }
}
