{
	inputs,
	config,
	pkgs,
	...
}: {
	# TODO: move stuff to common profile(potentially?)
	programs = {
		atuin = {
			enable = false;
			settings = {
				auto_sync = true;
				update_check = false;
				sync_frequency = "10m";
				search_mode = "fuzzy";
				filter_mode = "global";
				exit_mode = "return-original";
			};
		};
		broot = {
			enable = true;
		};
		command-not-found = {
			enable = true;
		};

		starship = {
			enable = true;
			enableBashIntegration = true;
			enableZshIntegration = true;
			settings = {
				add_newline = false;
				format = pkgs.lib.concatStrings [
					# "[╭](black)" "$fill" "$nix_shell" "[╮](black)" "$line_break"
					# "│" "─"
					# "│" "─"
					# "[╰](black)" "$os" "[\\[ $directory \\]](blue)" "[─](black)" "$character" # "╯"

					"$os" "$directory" "$c" "\n"
					"$username" "$character"

					# "$username" "$directory" "$character"
				];
				right_format = pkgs.lib.concatStrings [
					# "$time" "$cmd_duration" "[╯](black)"
					"$time" "$cmd_duration" "$nix_shell"

					# "$time" "$cmd_duration"
				];
				c = {
					# format = "";
					symbol = " ";
				};
				# character = {
				#     success_symbol = "[➜](bold green) ";
				#     error_symbol = "[➜](bold red) ";
				# };
				cmd_duration = {
					format = "[ $duration]($style)";
					show_notifications = true;
					min_time_to_notify = 20000;
				};
				directory = {
					format = "in [$path ]($style)[$read_only]($read_only_style)";
					fish_style_pwd_dir_length = 1;
					home_symbol = "󰋜";
					read_only = " ";
					style = "blue bold";
				};
				fill = {
					symbol = "─";
					style = "black";
				};
				nix_shell = {
					format = "[$symbol$state( \\($name\\))]($style)";
					symbol = "󱄅 ";
					heuristic = true;
				};
				os = {
					format = "[$symbol]($style)";
					disabled = false;
					style = "blue dimmed";
					symbols = {
						NixOS = "󱄅 ";
					};
				};
				time = {
					format = "[$time]($style) ";
					style = "white";
					use_12hr = true;
					disabled = false;
				};
				username = {
					style_user = "green bold";
					style_root = "red bold";
				};
			};
		};
		bash = {
			enable = true;
		};
		zsh = {
			# initExtraFirst = "zmodload zsh/zprof";
			initExtra = ''
				ZLE_RPROMPT_INDENT=0
			'';
			# initExtra = ''
			#     any-nix-shell zsh --info-right | source /dev/stdin
			# '';
			enable = true;
			autosuggestion.enable = true;
			enableCompletion = true;
			enableVteIntegration = true;
			autocd = true;
			# defaultKeymap = "viins";
			dirHashes = {
				movs = "/run/media/${config.home.username}/4545627b-bf85-4556-8d34-239e9301f743/unseen";
				games = "/run/media/${config.home.username}/88a877a8-0f92-4cc2-b1e7-a121dde16fcb/files";
			};
			dotDir = ".config/zsh";
			history = {
				# expireDuplicatesFirst = true;
				extended = true;
				ignoreDups = true;
				ignorePatterns = [
					"bash"
					"clear"
					"killall *"
					"pkill *"
					"zsh"
				];
				ignoreSpace = true;
				share = true;
			};
			historySubstringSearch = {
				enable = true;
			};
			oh-my-zsh = {
				enable = true;
				# extraConfig = ''
				#     zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github
				# '';
				plugins = [
					"git"
					"sudo"
				];
				# theme = "";
			};
			plugins = [
				{
					name = "fast-syntax-highlighting";
					src = inputs.zsh-f-sy-h;
					# file = "fast-syntax-highlighting";
				}
				{
					name = "zsh-completions";
					src = inputs.zsh-completions;
				}
			];
		};
	};
}
