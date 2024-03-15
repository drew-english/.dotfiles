# .dotfiles

Version controlled terminal configuration files.

## Usage

1. Install [stow](https://www.gnu.org/software/stow/) via the system package manager
2. Clone this repository to the home directory
3. To stow configurations for a single application, simply run `stow {folder}` with the corresponding folder.
4. To stow all configurations run the corresponding `{system}_stow.sh` script
> `rm` any conflicting files from the system
> Optionially use `stow --adopt` to import host system files here

