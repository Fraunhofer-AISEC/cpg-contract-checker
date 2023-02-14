function checkIt () public {

    bytes memory signature = hex"564f8b7ca4a729a34aedf3b065e20b5eaa129fd663243697025a428f27db086e6a7d6dc429c95a44143117a9ea02cd452bce4242b1adb2742b02a4a44e6d389b1c";

    require(signature.length == 65, "invalid signature length");
