{
	outputs,
	pkgs,
	...
}: {
	imports = [
		../common
		./hardware

		./boot
		./bluetooth.nix
		./dev.nix
		./network.nix
		./packages
		outputs.nixosModules.automount
	];

	programs.nix-ld = {
		enable = true;
		libraries = with pkgs; [];
	};
}
