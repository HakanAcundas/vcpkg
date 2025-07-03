vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO HakanAcundas/libczi
    REF 6e8298822b1e34b7a74b6717a9d2007739e2994d
    SHA512 842190c45b3124c793e384e5a0c0529a0dd1b9fa88f3242af4d548e5de0a2b7d3c5ae9009d8da43e4cfdbfda40baf3e663d31a04fb36c5a70c23ebc3b032912a
    HEAD_REF main
)

# Let vcpkg to find git
vcpkg_find_acquire_program(
    GIT
)

# Pass git to the port's cmake build system
get_filename_component(GIT_EXE_PATH ${GIT} DIRECTORY)
vcpkg_add_to_path(${GIT_EXE_PATH})

# set(VCPKG_CMAKE_CONFIGURE_OPTIONS "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
    ${FEATURE_OPTIONS}
    -DLIBCZI_BUILD_PREFER_EXTERNALPACKAGE_EIGEN3=ON
    -DLIBCZI_BUILD_PREFER_EXTERNALPACKAGE_RAPIDJSON=ON
    -DLIBCZI_BUILD_PREFER_EXTERNALPACKAGE_ZSTD=OFF
    -DLIBCZI_BUILD_UNITTESTS=OFF
)

vcpkg_cmake_install()
# vcpkg_cmake_config_fixup(CONFIG_PATH share/${PORT})

# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
# vcpkg_fixup_pkgconfig()
