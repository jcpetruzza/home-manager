{ config, lib, pkgs, ... }:

with lib;

{
  config = {
    programs.kakoune = {
      enable = true;
      plugins =
        [ pkgs.kakounePlugins.kak-fzf pkgs.kakounePlugins.kak-powerline ];
    };

    nmt.script = let plugins_kak = "home-path/share/kak/plugins.kak";
    in ''
      assertFileRegex ${plugins_kak} \
        '^source "/nix/store/.*-kak-powerline/share/kak/autoload/plugins/powerline/.*.kak"$'

      assertFileRegex ${plugins_kak} \
        '^source "/nix/store/.*-kak-fzf/share/kak/autoload/plugins/fzf/.*.kak"$'
    '';
  };
}
