# audio configuration
{config, lib, pkgs, ... }:

{
# audio configuration
security.rtkit.enable = true; # Enable RealtimeKit for audio purposes

services.pipewire = {
  enable = true;
  alsa.enable = true;
  # alsa.support32Bit = true;
  wireplumber.enable = true;
  pulse.enable = true;
  # Uncomment the following line if you want to use JACK applications
  # jack.enable = true;
};
}
