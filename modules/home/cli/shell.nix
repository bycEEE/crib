{
  config,
  isWsl,
  lib,
  pkgs,
  ...
}: let
  init = builtins.readFile ./scripts/init.sh;
  functions = builtins.readFile ./scripts/functions.sh;
  agent_bridge = builtins.readFile ./scripts/agent_bridge.sh;
  aliases = with pkgs; {
    k = lib.getExe kubectl;
    cat = lib.getExe bat;
    ls = lib.getExe exa;
    ll = "${lib.getExe exa} -l";
    la = "${lib.getExe exa} -a";
    lt = "${lib.getExe exa} --tree";
    lla = "${lib.getExe exa} -la";
    tree = "${lib.getExe exa} --tree --icons --tree";
  };
in {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    autocd = false;
    defaultKeymap = "viins";
    envExtra = ''
      export LS_COLORS="*~=0;38;2;67;76;94:bd=1;38;2;235;203;139;48;2;67;76;94:ca=0:cd=1;38;2;235;203;139;48;2;67;76;94:di=1;38;2;143;188;187:do=1;38;2;180;142;173;48;2;67;76;94:ex=1;38;2;208;135;112:fi=0;38;2;76;86;106:ln=1;38;2;163;190;140:mh=0:mi=1;38;2;236;239;244;48;2;191;97;106:no=0;38;2;76;86;106:or=1;38;2;236;239;244;48;2;191;97;106:ow=0:pi=1;38;2;235;203;139;48;2;67;76;94:rs=0;38;2;76;86;106:sg=0:so=1;38;2;180;142;173;48;2;67;76;94:st=0:su=0:tw=0:*.a=0;38;2;208;135;112:*.c=0;38;2;163;190;140:*.d=0;38;2;163;190;140:*.h=0;38;2;163;190;140:*.m=0;38;2;163;190;140:*.o=0;38;2;67;76;94:*.p=0;38;2;163;190;140:*.r=0;38;2;163;190;140:*.t=0;38;2;163;190;140:*.z=1;38;2;129;161;193:*.7z=1;38;2;129;161;193:*.as=0;38;2;163;190;140:*.bc=0;38;2;67;76;94:*.bz=1;38;2;129;161;193:*.cc=0;38;2;163;190;140:*.cp=0;38;2;163;190;140:*.cr=0;38;2;163;190;140:*.cs=0;38;2;163;190;140:*.di=0;38;2;163;190;140:*.el=0;38;2;163;190;140:*.ex=0;38;2;163;190;140:*.fs=0;38;2;163;190;140:*.go=0;38;2;163;190;140:*.gv=0;38;2;163;190;140:*.gz=1;38;2;129;161;193:*.hh=0;38;2;163;190;140:*.hi=0;38;2;67;76;94:*.hs=0;38;2;163;190;140:*.jl=0;38;2;163;190;140:*.js=0;38;2;163;190;140:*.ko=0;38;2;208;135;112:*.kt=0;38;2;163;190;140:*.la=0;38;2;67;76;94:*.ll=0;38;2;163;190;140:*.lo=0;38;2;67;76;94:*.md=0;38;2;180;142;173:*.ml=0;38;2;163;190;140:*.mn=0;38;2;163;190;140:*.nb=0;38;2;163;190;140:*.pl=0;38;2;163;190;140:*.pm=0;38;2;163;190;140:*.pp=0;38;2;163;190;140:*.ps=0;38;2;180;142;173:*.py=0;38;2;163;190;140:*.rb=0;38;2;163;190;140:*.rm=0;38;2;180;142;173:*.rs=0;38;2;163;190;140:*.sh=0;38;2;163;190;140:*.so=0;38;2;208;135;112:*.td=0;38;2;163;190;140:*.ts=0;38;2;163;190;140:*.ui=0;38;2;180;142;173:*.vb=0;38;2;163;190;140:*.wv=0;38;2;180;142;173:*.xz=1;38;2;129;161;193:*.aif=0;38;2;180;142;173:*.ape=0;38;2;180;142;173:*.apk=1;38;2;129;161;193:*.arj=1;38;2;129;161;193:*.asa=0;38;2;163;190;140:*.aux=0;38;2;67;76;94:*.avi=0;38;2;180;142;173:*.awk=0;38;2;163;190;140:*.bag=1;38;2;129;161;193:*.bak=0;38;2;67;76;94:*.bat=0;38;2;208;135;112:*.bbl=0;38;2;67;76;94:*.bcf=0;38;2;67;76;94:*.bib=0;38;2;180;142;173:*.bin=1;38;2;129;161;193:*.blg=0;38;2;67;76;94:*.bmp=0;38;2;180;142;173:*.bsh=0;38;2;163;190;140:*.bst=0;38;2;180;142;173:*.bz2=1;38;2;129;161;193:*.c++=0;38;2;163;190;140:*.cfg=0;38;2;180;142;173:*.cgi=0;38;2;163;190;140:*.clj=0;38;2;163;190;140:*.com=0;38;2;208;135;112:*.cpp=0;38;2;163;190;140:*.css=0;38;2;163;190;140:*.csv=0;38;2;180;142;173:*.csx=0;38;2;163;190;140:*.cxx=0;38;2;163;190;140:*.deb=1;38;2;129;161;193:*.def=0;38;2;163;190;140:*.dll=0;38;2;208;135;112:*.dmg=1;38;2;129;161;193:*.doc=0;38;2;180;142;173:*.dot=0;38;2;163;190;140:*.dox=0;38;2;163;190;140:*.dpr=0;38;2;163;190;140:*.elc=0;38;2;163;190;140:*.elm=0;38;2;163;190;140:*.epp=0;38;2;163;190;140:*.eps=0;38;2;180;142;173:*.erl=0;38;2;163;190;140:*.exe=0;38;2;208;135;112:*.exs=0;38;2;163;190;140:*.fls=0;38;2;67;76;94:*.flv=0;38;2;180;142;173:*.fnt=0;38;2;180;142;173:*.fon=0;38;2;180;142;173:*.fsi=0;38;2;163;190;140:*.fsx=0;38;2;163;190;140:*.gif=0;38;2;180;142;173:*.git=0;38;2;67;76;94:*.gvy=0;38;2;163;190;140:*.h++=0;38;2;163;190;140:*.hpp=0;38;2;163;190;140:*.htc=0;38;2;163;190;140:*.htm=0;38;2;180;142;173:*.hxx=0;38;2;163;190;140:*.ico=0;38;2;180;142;173:*.ics=0;38;2;180;142;173:*.idx=0;38;2;67;76;94:*.ilg=0;38;2;67;76;94:*.img=1;38;2;129;161;193:*.inc=0;38;2;163;190;140:*.ind=0;38;2;67;76;94:*.ini=0;38;2;180;142;173:*.inl=0;38;2;163;190;140:*.ipp=0;38;2;163;190;140:*.iso=1;38;2;129;161;193:*.jar=1;38;2;129;161;193:*.jpg=0;38;2;180;142;173:*.kex=0;38;2;180;142;173:*.kts=0;38;2;163;190;140:*.log=0;38;2;67;76;94:*.ltx=0;38;2;163;190;140:*.lua=0;38;2;163;190;140:*.m3u=0;38;2;180;142;173:*.m4a=0;38;2;180;142;173:*.m4v=0;38;2;180;142;173:*.mid=0;38;2;180;142;173:*.mir=0;38;2;163;190;140:*.mkv=0;38;2;180;142;173:*.mli=0;38;2;163;190;140:*.mov=0;38;2;180;142;173:*.mp3=0;38;2;180;142;173:*.mp4=0;38;2;180;142;173:*.mpg=0;38;2;180;142;173:*.nix=0;38;2;180;142;173:*.odp=0;38;2;180;142;173:*.ods=0;38;2;180;142;173:*.odt=0;38;2;180;142;173:*.ogg=0;38;2;180;142;173:*.org=0;38;2;180;142;173:*.otf=0;38;2;180;142;173:*.out=0;38;2;67;76;94:*.pas=0;38;2;163;190;140:*.pbm=0;38;2;180;142;173:*.pdf=0;38;2;180;142;173:*.pgm=0;38;2;180;142;173:*.php=0;38;2;163;190;140:*.pid=0;38;2;67;76;94:*.pkg=1;38;2;129;161;193:*.png=0;38;2;180;142;173:*.pod=0;38;2;163;190;140:*.ppm=0;38;2;180;142;173:*.pps=0;38;2;180;142;173:*.ppt=0;38;2;180;142;173:*.pro=0;38;2;163;190;140:*.ps1=0;38;2;163;190;140:*.psd=0;38;2;180;142;173:*.pyc=0;38;2;67;76;94:*.pyd=0;38;2;67;76;94:*.pyo=0;38;2;67;76;94:*.rar=1;38;2;129;161;193:*.rpm=1;38;2;129;161;193:*.rst=0;38;2;180;142;173:*.rtf=0;38;2;180;142;173:*.sbt=0;38;2;163;190;140:*.sql=0;38;2;163;190;140:*.sty=0;38;2;67;76;94:*.svg=0;38;2;180;142;173:*.swf=0;38;2;180;142;173:*.swp=0;38;2;67;76;94:*.sxi=0;38;2;180;142;173:*.sxw=0;38;2;180;142;173:*.tar=1;38;2;129;161;193:*.tbz=1;38;2;129;161;193:*.tcl=0;38;2;163;190;140:*.tex=0;38;2;163;190;140:*.tgz=1;38;2;129;161;193:*.tif=0;38;2;180;142;173:*.tml=0;38;2;180;142;173:*.tmp=0;38;2;67;76;94:*.toc=0;38;2;67;76;94:*.tsx=0;38;2;163;190;140:*.ttf=0;38;2;180;142;173:*.txt=0;38;2;180;142;173:*.vcd=1;38;2;129;161;193:*.vim=0;38;2;163;190;140:*.vob=0;38;2;180;142;173:*.wav=0;38;2;180;142;173:*.wma=0;38;2;180;142;173:*.wmv=0;38;2;180;142;173:*.xcf=0;38;2;180;142;173:*.xlr=0;38;2;180;142;173:*.xls=0;38;2;180;142;173:*.xml=0;38;2;180;142;173:*.xmp=0;38;2;180;142;173:*.yml=0;38;2;180;142;173:*.zip=1;38;2;129;161;193:*.zsh=0;38;2;163;190;140:*.zst=1;38;2;129;161;193:*TODO=1;38;2;180;142;173:*hgrc=0;38;2;163;190;140:*.bash=0;38;2;163;190;140:*.conf=0;38;2;180;142;173:*.dart=0;38;2;163;190;140:*.diff=0;38;2;163;190;140:*.docx=0;38;2;180;142;173:*.epub=0;38;2;180;142;173:*.fish=0;38;2;163;190;140:*.flac=0;38;2;180;142;173:*.h264=0;38;2;180;142;173:*.hgrc=0;38;2;163;190;140:*.html=0;38;2;180;142;173:*.java=0;38;2;163;190;140:*.jpeg=0;38;2;180;142;173:*.json=0;38;2;180;142;173:*.less=0;38;2;163;190;140:*.lisp=0;38;2;163;190;140:*.lock=0;38;2;67;76;94:*.make=0;38;2;163;190;140:*.mpeg=0;38;2;180;142;173:*.opus=0;38;2;180;142;173:*.orig=0;38;2;67;76;94:*.pptx=0;38;2;180;142;173:*.psd1=0;38;2;163;190;140:*.psm1=0;38;2;163;190;140:*.purs=0;38;2;163;190;140:*.rlib=0;38;2;67;76;94:*.sass=0;38;2;163;190;140:*.scss=0;38;2;163;190;140:*.tbz2=1;38;2;129;161;193:*.tiff=0;38;2;180;142;173:*.toml=0;38;2;180;142;173:*.webm=0;38;2;180;142;173:*.webp=0;38;2;180;142;173:*.woff=0;38;2;180;142;173:*.xbps=1;38;2;129;161;193:*.xlsx=0;38;2;180;142;173:*.yaml=0;38;2;180;142;173:*.cabal=0;38;2;163;190;140:*.cache=0;38;2;67;76;94:*.class=0;38;2;67;76;94:*.cmake=0;38;2;163;190;140:*.dyn_o=0;38;2;67;76;94:*.ipynb=0;38;2;163;190;140:*.mdown=0;38;2;180;142;173:*.patch=0;38;2;163;190;140:*.scala=0;38;2;163;190;140:*.shtml=0;38;2;180;142;173:*.swift=0;38;2;163;190;140:*.toast=1;38;2;129;161;193:*.xhtml=0;38;2;180;142;173:*README=0;38;2;180;142;173:*passwd=0;38;2;180;142;173:*shadow=0;38;2;180;142;173:*.config=0;38;2;180;142;173:*.dyn_hi=0;38;2;67;76;94:*.flake8=0;38;2;163;190;140:*.gradle=0;38;2;163;190;140:*.groovy=0;38;2;163;190;140:*.ignore=0;38;2;163;190;140:*.matlab=0;38;2;163;190;140:*COPYING=0;38;2;180;142;173:*INSTALL=0;38;2;180;142;173:*LICENSE=0;38;2;180;142;173:*TODO.md=1;38;2;180;142;173:*.desktop=0;38;2;180;142;173:*.gemspec=0;38;2;163;190;140:*Doxyfile=0;38;2;163;190;140:*Makefile=0;38;2;163;190;140:*TODO.txt=1;38;2;180;142;173:*setup.py=0;38;2;163;190;140:*.DS_Store=0;38;2;67;76;94:*.cmake.in=0;38;2;163;190;140:*.fdignore=0;38;2;163;190;140:*.kdevelop=0;38;2;163;190;140:*.markdown=0;38;2;180;142;173:*.rgignore=0;38;2;163;190;140:*COPYRIGHT=0;38;2;180;142;173:*README.md=0;38;2;180;142;173:*configure=0;38;2;163;190;140:*.gitconfig=0;38;2;163;190;140:*.gitignore=0;38;2;163;190;140:*.localized=0;38;2;67;76;94:*.scons_opt=0;38;2;67;76;94:*CODEOWNERS=0;38;2;163;190;140:*Dockerfile=0;38;2;180;142;173:*INSTALL.md=0;38;2;180;142;173:*README.txt=0;38;2;180;142;173:*SConscript=0;38;2;163;190;140:*SConstruct=0;38;2;163;190;140:*.gitmodules=0;38;2;163;190;140:*.synctex.gz=0;38;2;67;76;94:*.travis.yml=0;38;2;163;190;140:*INSTALL.txt=0;38;2;180;142;173:*LICENSE-MIT=0;38;2;180;142;173:*MANIFEST.in=0;38;2;163;190;140:*Makefile.am=0;38;2;163;190;140:*Makefile.in=0;38;2;67;76;94:*.applescript=0;38;2;163;190;140:*.fdb_latexmk=0;38;2;67;76;94:*CONTRIBUTORS=0;38;2;180;142;173:*appveyor.yml=0;38;2;163;190;140:*configure.ac=0;38;2;163;190;140:*.clang-format=0;38;2;163;190;140:*.gitattributes=0;38;2;163;190;140:*.gitlab-ci.yml=0;38;2;163;190;140:*CMakeCache.txt=0;38;2;67;76;94:*CMakeLists.txt=0;38;2;163;190;140:*LICENSE-APACHE=0;38;2;180;142;173:*CONTRIBUTORS.md=0;38;2;180;142;173:*.sconsign.dblite=0;38;2;67;76;94:*CONTRIBUTORS.txt=0;38;2;180;142;173:*requirements.txt=0;38;2;163;190;140:*package-lock.json=0;38;2;67;76;94:*.CFUserTextEncoding=0;38;2;67;76;94"
    '';
    shellAliases = aliases;
    # initExtraBeforeCompInit = ''
    #   fpath+=(${config.home.profileDirectory}/share/bash-completion/completions)
    # '';
    initExtra = ''
      ${init}
      ${functions}
      ${lib.optionalString isWsl ''
        ${agent_bridge}
      ''}

      # unset RPS1
      ## Job Control
      setopt long_list_jobs # Display PID when suspending processes as well.
      setopt notify # Report the status of backgrounds jobs immediately.

      ## Set key bindings
      bindkey "^[[1;5D" backward-word # ctrl + left
      bindkey "^[[1;5C" forward-word # ctrl + right
      bindkey "^[[1;3D" beginning-of-line # alt + left
      bindkey "^[[1;3C" end-of-line # alt + right
      bindkey "^H" backward-kill-word # ctrl + backspace

      ### fzf-tab
      ### https://github.com/Aloxaf/fzf-tab/wiki/Preview
      # setopt globdots # show hidden files

      # disable sort when completing `git checkout`
      zstyle ':completion:*:git-checkout:*' sort false

      # set descriptions format to enable group support
      zstyle ':completion:*:descriptions' format '[%d]'

      # set list-colors to enable filename colorizing
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

      # preview directory's content with exa when completing cd
      zstyle ':fzf-tab:complete:cd:*' fzf-preview '${lib.getExe pkgs.exa} -1 --color=always $realpath'

      # switch group using `,` and `.`
      zstyle ':fzf-tab:*' switch-group ',' '.'

      # give a preview of commandline arguments when completing `kill`
      zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
      zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
      zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

      # show systemd unit status
      zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

      # # show file preview
      # zstyle ':fzf-tab:complete:*:*' fzf-preview '${lib.getExe pkgs.moar} ''${(Q)realpath}'

      # # show command options and subcommands
      # zstyle ':fzf-tab:complete:*:options' fzf-preview
      # zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

      # environment variable
      zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ''${(P)word}'
    '';
    # profileExtra = ''
    #   ${lib.optionalString pkgs.stdenvNoCC.isLinux "[[ -e /etc/profile ]] && source /etc/profile"}
    # '';

    history = {
      share = false;
      extended = true; # Save timestamp to history file
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      ignoreDups = true;
      save = 100000;
      size = 100000;
      path = "${config.xdg.dataHome}/zsh/.zsh_history";
    };

    historySubstringSearch.enable = true;

    plugins = [
      {
        name = "fast-syntax-highlighting";
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
        src = pkgs.zsh-fast-syntax-highlighting;
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          sha256 = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
        };
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
      # {
      #   name = "zsh-bash-completions-fallback";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "3v1n0";
      #     repo = "zsh-bash-completions-fallback";
      #     rev = "da560de3178ec389562debedbce16eca8cdf06c3";
      #     sha256 = "sha256-Sdo+5DwBK2PqpQl/qnmWy+M47VFcE7m4/R1Cu9oHBVg=";
      #   };
      # }
    ];

    loginExtra = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };

  # programs.bash = {
  #   enable = true;
  #   enableCompletion = true;
  #   # shellAliases = aliases;
  #   initExtra = ''
  #     ${init}
  #     ${functions}
  #   '';
  # };
}
