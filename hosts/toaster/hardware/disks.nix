{
	inputs,
	...
}: {

	imports = [
		inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
		inputs.nixos-hardware.nixosModules.common-pc-laptop-hdd
	];
}
