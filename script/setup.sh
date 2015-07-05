cat >> $HOME/.bashrc <<EOF

# Add MAGMA setup
source $HOME/local/script/vars.sh
EOF

cat >> $HOME/.bash_profile <<EOF

# For MAGMA setup
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOF

mkdir -p $HOME/.config/matplotlib/
cat > .config/matplotlib/matplotlibrc <<EOF
## matplotlibrc for MAGMA
#
# Customize so that we default to a non-interactive backend.
# For more details, see http://matplotlib.org/users/customizing.html

backend : Cairo
EOF
