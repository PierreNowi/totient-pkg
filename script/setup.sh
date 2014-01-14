cat >> .bashrc <<EOF

# Add CS5220 setup
source /share/cs-instructional/cs5220/script/vars.sh
EOF

cat >> .bash_profile <<EOF

# For CS5220 setup
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOF
