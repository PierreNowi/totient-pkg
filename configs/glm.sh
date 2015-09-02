#!/bin/sh
#
# OpenGL Math (GLM)
# http://sourceforge.net/projects/ogl-math/

SF=http://downloads.sourceforge.net/project
GLM=glm-0.9.6.3

source ./helper.sh $*
BUILD_TAG=0.9.6.3-$TOOLCHAIN

stage_dl_cmake $SF/ogl-math/$GLM/$GLM.zip \
	-DCMAKE_INSTALL_PREFIX=$PREFIX/glm-$BUILD_TAG
