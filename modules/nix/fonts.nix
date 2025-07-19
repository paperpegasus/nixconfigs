{ pkgs, ...}:
{
 fonts.packages = with pkgs; [
    jetbrains-mono
    inter

]++ (with nerd-fonts; [
  fira-code
  jetbrains-mono
  fira-mono
  geist-mono
  symbols-only
]);
}
