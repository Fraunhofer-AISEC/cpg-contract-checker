JX:Attack juanxavier$ solc-select install
    Available versions to install:
    Traceback (most recent call last):
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/urllib/request.py", line 1346, in do_open
        h.request(req.get_method(), req.selector, req.data, headers,
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/http/client.py", line 1285, in request
        self._send_request(method, url, body, headers, encode_chunked)
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/http/client.py", line 1331, in _send_request
        self.endheaders(body, encode_chunked=encode_chunked)
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/http/client.py", line 1280, in endheaders
        self._send_output(message_body, encode_chunked=encode_chunked)
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/http/client.py", line 1040, in _send_output
        self.send(msg)
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/http/client.py", line 980, in send
        self.connect()
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/http/client.py", line 1454, in connect
        self.sock = self._context.wrap_socket(self.sock,
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/ssl.py", line 501, in wrap_socket
        return self.sslsocket_class._create(
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/ssl.py", line 1041, in _create
        self.do_handshake()
      File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/ssl.py", line 1310, in do_handshake
        self._sslobj.do_handshake()
    ssl.SSLCertVerificationError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1129)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/Library/Frameworks/Python.framework/Versions/3.9/bin/solc-select", line 8, in <module>
    sys.exit(solc_select())
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/site-packages/solc_select/__main__.py", line 48, in solc_select
    for version in get_installable_versions():
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/site-packages/solc_select/solc_select.py", line 105, in get_installable_versions
    installable = list(set(get_available_versions()) - set(installed_versions()))
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/site-packages/solc_select/solc_select.py", line 112, in get_available_versions
    list_json = urllib.request.urlopen(url).read()
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/urllib/request.py", line 214, in urlopen
    return opener.open(url, data, timeout)
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/urllib/request.py", line 517, in open
    response = self._open(req, data)
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/urllib/request.py", line 534, in _open
    result = self._call_chain(self.handle_open, protocol, protocol +
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/urllib/request.py", line 494, in _call_chain
    result = func(*args)
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/urllib/request.py", line 1389, in https_open
    return self.do_open(http.client.HTTPSConnection, req,
  File "/Library/Frameworks/Python.framework/Versions/3.9/lib/python3.9/urllib/request.py", line 1349, in do_open
    raise URLError(err)
urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1129)>
