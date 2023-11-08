default:
	just --list

HOSTNAME := if os() == "macos" {`scutil --get LocalHostName`} else {`hostname| sed 's/.local//'`}
USERNAME := `whoami | sed 's/\.//g'`

news:
	home-manager news --flake .#{{USERNAME}}@{{HOSTNAME}}

update:
	nix flake update --commit-lock-file

build:
	nix build .#homeConfigurations.{{USERNAME}}@{{HOSTNAME}}.activationPackage && ./result/activate

apply:
	# nix run .#homeConfigurations.{{USERNAME}}@{{HOSTNAME}}.activationPackage
	home-manager switch --flake .#{{USERNAME}}@{{HOSTNAME}} --show-trace -v

edit package:
	nix edit -f "<nixpkgs>" {{package}}

push-cachix:
	just build
	cachix push byceee ./result

rebuild:
	sudo nixos-rebuild switch --flake .#{{USERNAME}}@{{HOSTNAME}}

repair:
	nix-store --verify --check-contents --repair

clean:
	nix-store --gc
	nix-collect-garbage --delete-older-than 7d
	# nix-collect-garbage -d
	home-manager expire-generations "-7 days"

optimize:
	nix-store --optimise

visualise:
	nix-du -s 100MB | dot -Tsvg > result.svg

# Gets github hash from URL, takes param1: username, param2: reponame
get-github-hash *args:
	nix run github:seppeljordan/nix-prefetch-github -- {{args}}

# Gets github hash from latest release, takes param1: username, param2: reponame
get-github-latest-release-hash *args:
	nix-prefetch-github-latest-release -- {{args}}
