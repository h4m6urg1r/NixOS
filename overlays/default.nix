{
	inputs,
	...
}: {
	# This one brings our custom packages from the 'pkgs' directory
	additions = final: _prev: import ../pkgs {pkgs = final;};

	# This one contains whatever you want to overlay
	# You can change versions, add patches, set compilation flags, anything really.
	# https://nixos.wiki/wiki/Overlays
	modifications = final: prev: {
		# example = prev.example.overrideAttrs (oldAttrs: rec {
		# ...
		# });

		# Always gets fucked, motherfucker
		linuxPackages_latest = prev.linuxPackages_latest.extend (self: super: {
			rtl8812au = super.rtl8812au.overrideAttrs (oldAttrs: rec {
				src = inputs.rtl8812au;
			});
		});
	};

	stable-packages = final: _prev: {
		stable = import inputs.nixpkgs-stable {
			system = final.system;
			config.allowUnfree = true;
		};
	};
	unstable-packages = final: _prev: {
		unstable = import inputs.nixpkgs-unstable {
			system = final.system;
			config.allowUnfree = true;
		};
	};
}
