{
	inputs,
	...
}: {
	imports = [
		inputs.nixos-hardware.nixosModules.asus-battery
	];
}
