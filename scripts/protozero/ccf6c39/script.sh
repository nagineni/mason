#!/usr/bin/env bash

MASON_NAME=protozero
MASON_VERSION=ccf6c39
MASON_HEADER_ONLY=true

. ${MASON_DIR}/mason.sh

function mason_load_source {
    mason_download \
        https://github.com/mapbox/protozero/tarball/${MASON_VERSION} \
        9ba3952cf3be44aa0290865e1dada5d9371e94bb

    mason_extract_tar_gz

    export MASON_BUILD_PATH=${MASON_ROOT}/.build/mapbox-protozero-${MASON_VERSION}
}

function mason_compile {
    mkdir -p ${MASON_PREFIX}/include/
    cp -r include/protozero ${MASON_PREFIX}/include/protozero
}

function mason_cflags {
    echo "-I${MASON_PREFIX}/include"
}

function mason_ldflags {
    :
}

mason_run "$@"
