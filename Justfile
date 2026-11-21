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
	# nix build .#homeConfigurations.{{USERNAME}}@{{HOSTNAME}}.activationPackage && ./result/activate
	home-manager switch --flake .#{{USERNAME}}@{{HOSTNAME}} --show-trace -v

edit package:
	nix edit -f "<nixpkgs>" {{package}}

push-cachix:
	just build
	cachix push byceee ./result

# Like build, but re-evaluates from scratch instead of trusting the eval cache.
# Keeps ~/.cache/nix (fetched inputs, tarballs) so nothing is re-downloaded.
rebuild:
	nix build .#homeConfigurations.{{USERNAME}}@{{HOSTNAME}}.activationPackage --option eval-cache false && ./result/activate

repair:
	nix-store --verify --check-contents --repair

clean:
	home-manager expire-generations "-1 days"
	nix-collect-garbage --delete-older-than 1d
	# nix-store --gc
	# delete everything except current generation
	# nix-collect-garbage --delete-old
	# sudo nix-collect-garbage -d

optimize:
	nix-store --optimise

visualise:
	nix-du -s 100MB | dot -Tsvg > result.svg

diff:
	nix profile diff-closures --profile ~/.local/state/nix/profiles/home-manager

# Prints a fetchFromGitHub call with hash; rev defaults to the default branch HEAD
get-github-hash owner repo rev="":
	nurl https://github.com/{{owner}}/{{repo}} {{rev}}

# Same, pinned to the repo's latest GitHub release tag
get-github-latest-release-hash owner repo:
	nurl https://github.com/{{owner}}/{{repo}} "$(gh release view -R {{owner}}/{{repo}} --json tagName -q .tagName)"

printenv:
	printenv
