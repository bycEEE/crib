{...}: {
  programs.vim = {
    enable = true;
    extraConfig = ''
      set mouse=a               "Set mouse support to all modes
      "set linebreak	          "Break lines at word (requires Wrap lines)
      "set showbreak=+++      	"Wrap-broken line prefix
      "set textwidth=100	      "Line wrap (number of cols)
      set showmatch	            "Highlight matching brace
      "set visualbell	          "Use visual bell (no beeping, flashes screen)
      set title                 "Show filename in window title

      set hlsearch	 "Highlight all search results
      set smartcase	 "Override the 'ignorecase' option if the search pattern contains uppercase characters
      set ignorecase "Always case-insensitive
      set incsearch	 "Searches for strings incrementally
      set gdefault	 "Imply global for new searches

      set autoindent	  "Auto-indent new lines
      set expandtab    	"Use spaces instead of tabs
      set shiftwidth=2	"Number of auto-indent spaces
      set smartindent	  "Enable smart-indent
      set smarttab	    "Enable smart-tabs
      set softtabstop=2	"Number of spaces per Tab
    '';
  };
}
