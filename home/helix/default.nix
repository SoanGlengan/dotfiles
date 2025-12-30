{ pkgs, ... }:

{


  home.packages = with pkgs; [
    clang-tools
    lldb
    nixd
    glibc
    uclibc
    # matlab-language-server

    # Language servers
    vhdl-ls
    verible
    svls
    zls
    nixd
    # python311Packages.python-lsp-server
    nodePackages.bash-language-server
    # typst-lsp
    nixfmt-rfc-style
    tinymist
    typstyle
    # pkgs.symlinkJoin {
    #   name = "qc ";
    #   paths = [writeScriptBin "qc" ''
    #     (read a; qalc -t $a)
    #   '' libqalculate];
    #   buildInputs = [makeWrapper];
    #   postBuild = "wrapProgram $out/bin/qc --prefix PATH : $out/bin";
    # }
    libqalculate
    (writeScriptBin "qc" ''
      #!${pkgs.zsh}/bin/zsh
      read a 
      qalc -t $a
    '')

    # (writeTextFile {
    #   name = "qc";
    #   executable = true;
    #   destination = "/bin/}";
    #   text = ''
    #     read a 
    #     qalc -t $a
    #     '';
    #   checkPhase = ''
    #     ${stdenv.shell} -n $out/bin/${name}
    #   '';
    #   })
  ];


  
  

  programs.helix = {
    enable = true;

    languages = {
      language-server.cpp-lsp= { 
        command = "clangd"; 
        args = [
          "--compile-commands-dir=compile_commands_directory"
        ];
      };
        # command = "mlang";
      language-server.verilog-lsp= { 
        command = "svls"; 
      };
      language-server.tinymist = {
        config = {
          # exportPdf = "onDocumentHasTitle";
          formatterMode = "typstyle";
          # outputPath = "$root/out/$dir/$name";
        };
      };

      language-server.nixd = {
        command = "nixd";
      };

      language = [
        {
          name = "cpp";
          # indent = { tab-width = 4;  unit = "   "; };
        }
        {
          name = "matlab";
          indent = { 
            tab-width = 4; 
            unit = "    "; 
          };
          language-servers = ["matlab-lsp"];
        }
        {
          name = "nix";
          indent = { 
            tab-width = 4; 
            unit = " "; 
          };
          formatter = { command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";};
          language-servers = [ "nixd" ];
        }
        {
          name = "verilog";
        }
      ];
    };

    
    ignores = [
      ".direnv"
    ];

    settings = {
      # theme = "doom_acario_dark";
      theme = "ayu_dark";
      editor = {
        bufferline = "always";
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "error";
        };
        file-picker = {
          hidden = false;
          git-ignore = false;
        };
        indent-guides.render = true;
        auto-pairs = true;
        line-number = "relative";
        soft-wrap.enable = true;
        mouse = true;
        insert-final-newline = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline.center = ["version-control" "register"];
      };
      keys = {
        normal = {
          space = {
            f = "file_picker_in_current_directory";
            F = "file_picker";
          };
          q = {
            # p = ":run-shell-command";
            # w = ":";
            f = ":format";
          };
        };
      };
    };
  };
}

