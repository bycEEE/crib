default:
	just --list

HOSTNAME := `hostname| sed 's/.local//'`
# NIXPATH := "nixpkgs=/nix/var/nix/profiles/per-user/tyrel/channels/nixpkgs:/nix/var/nix/profiles/per-user/tyrel/channels"

update:
	nix flake update

build:
	nix build .#homeConfigurations.bchoy@{{HOSTNAME}}.activationPackage && ./result/activate

apply:
	# nix run .#homeConfigurations.bchoy@{{HOSTNAME}}.activationPackage
	home-manager switch --flake .#bchoy@{{HOSTNAME}}

push-cachix:
	just build
	cachix push byceee ./result

rebuild:
	sudo nixos-rebuild switch --flake .#bchoy@{{HOSTNAME}}

repair:
	nix-store --verify --check-contents --repair

clean:
	nix-store --gc
	nix-collect-garbage --delete-older-than 7d
	# nix-collect-garbage -d
	home-manager expire-generations "-7 days"

visualise:
	nix-du -s 100MB | dot -Tsvg > result.svg

# Gets github hash from URL, takes param1: username, param2: reponame
get-github-hash *args:
	nix run github:seppeljordan/nix-prefetch-github -- {{args}}
