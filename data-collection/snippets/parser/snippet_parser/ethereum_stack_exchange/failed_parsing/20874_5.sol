Which function is called, fallback() or receive()?

        send Ether
            |
        msg.data is empty?
            /       \
          yes        no
          /           \
 receive() exists?     fallback()
        /     \
    yes        no
    /           \
receive()      fallback()
