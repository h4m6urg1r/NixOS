{
	pkgs,
	...
}: {
	services.tumbler.enable = true;
	environment.systemPackages = with pkgs; [
		mpv
		ffmpegthumbnailer
		gparted
		gnome.zenity
		# dunst
		libnotify
		# poppler
		xfce.thunar
		xfce.ristretto
		## xorg
		# xclip
		# xdotool
		## wayland
		wl-clipboard
		# wtype
		ydotool
		firefox
	];
}
