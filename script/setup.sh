cat >> $HOME/.bashrc <<EOF

# Add CS5220 setup
source $HOME/script/vars.sh
EOF

cat >> $HOME/.bash_profile <<EOF

# For CS5220 setup
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOF

mkdir -p $HOME/.config/matplotlib/
cat > .config/matplotlib/matplotlibrc <<EOF
## matplotlibrc for CS5220
#
# Customize so that we default to a non-interactive backend.
# For more details, see http://matplotlib.org/users/customizing.html

backend : Cairo
EOF
