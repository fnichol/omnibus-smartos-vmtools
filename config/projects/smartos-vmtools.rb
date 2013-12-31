
name "smartos-vmtools"
maintainer "fnichol@nichol.ca"
homepage "https://github.com/fnichol/omnibus-smartos-vmtools"

replaces        "smartos-vmtools"
install_path    "/opt/smartos-vmtools"
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# creates required build directories
dependency "preparation"

# smartos-vmtools dependencies/components
dependency "mdata-client"

# version manifest file
dependency "version-manifest"

exclude "\.git*"
exclude "bundler\/git"
