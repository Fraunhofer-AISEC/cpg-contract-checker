::ffff:127.0.0.1 - - [14/Feb/2023 16:18:25] "GET / HTTP/1.1" 200 -
::ffff:127.0.0.1 - - [15/Feb/2023 10:13:58] "GET /src/ HTTP/1.1" 200 -
::ffff:127.0.0.1 - - [15/Feb/2023 10:14:04] code 404, message File not found
::ffff:127.0.0.1 - - [15/Feb/2023 10:14:04] "GET /favicon.ico HTTP/1.1" 404 -
----------------------------------------
Exception occurred during processing of request from ('::ffff:127.0.0.1', 62286, 0, 0)
Traceback (most recent call last):
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 726, in send_head
    f = open(path, 'rb')
        ^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: 'C:\\_jpegdegens\\favicon.ico'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\socketserver.py", line 691, in process_request_thread
    self.finish_request(request, client_address)
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 1306, in finish_request
    self.RequestHandlerClass(request, client_address, self,
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 667, in __init__
    super().__init__(*args, **kwargs)
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\socketserver.py", line 755, in __init__
    self.handle()
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 432, in handle
    self.handle_one_request()
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 420, in handle_one_request
    method()
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 671, in do_GET
    f = self.send_head()
        ^^^^^^^^^^^^^^^^
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 728, in send_head
    self.send_error(HTTPStatus.NOT_FOUND, "File not found")
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\http\server.py", line 487, in send_error
    self.wfile.write(body)
  File "C:\Users\GCC-V\AppData\Local\Programs\Python\Python311\Lib\socketserver.py", line 834, in write
    self._sock.sendall(b)
ConnectionAbortedError: [WinError 10053] An established connection was aborted by the software in your host machine
----------------------------------------
