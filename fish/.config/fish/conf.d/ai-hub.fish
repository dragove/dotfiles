
# ai-hub
set -l esx_cli_bin "/home/dove/.esign-inter/bin"
contains -- $esx_cli_bin $PATH; or set -gx PATH $esx_cli_bin $PATH
