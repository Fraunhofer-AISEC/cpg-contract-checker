docker_cmd = 'docker run ethereum/solc:0.6.0 --standard-json < ' + self.base_path + 'data.json --allow-paths '+ self.base_path +' > out.json'

try:
     bincode = subprocess.check_output(docker_cmd,shell=True,stderr=subprocess.STDOUT).decode('utf-8')

except subprocess.CalledProcessError as e:
    raise RuntimeError("command '{}' return with error (code {}): {}".format(e.cmd, e.returncode, e.output))
