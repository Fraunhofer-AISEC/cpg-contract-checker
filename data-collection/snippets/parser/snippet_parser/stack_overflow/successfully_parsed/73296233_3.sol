function fooYul(uint8 version) public {
    assembly {
        switch version
        case 1 {
            
        }
        case 2 {
            
        }
        default {
            revert(0, 0)
        }
    }
}
