{
    services = {
    openssh = {
      # sshd.enable alias
      enable = true;
      openFirewall = true; # automatically open ports in firewall
      # ports = [ 22 ]; # 16bit unsigned int
      startWhenNeeded = true; # socket activated
      settings = {
        #LogLevel = "DEBUG";
        PasswordAuthentication = true; # def: false=require public key auth?
        UseDns = true; # false::
        AllowUsers = [
          "paperpegasus"
          "git"
        ];
      };
    };
    };
}
