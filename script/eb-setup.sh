module load EasyBuild

mkdir -p /home/dsb253/.config/easybuild/
cat > /home/dsb253/.config/easybuild/config.cfg <<EOF
[config]
modules-tool=Lmod
buildpath=/tmp/dsb253/easybuild/build
EOF
