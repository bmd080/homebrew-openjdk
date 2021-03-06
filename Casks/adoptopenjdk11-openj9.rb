# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk11-openj9' do
  version '11.0.7,10'
  sha256 '1c00766ddf7307bd9dfdc1e502bd885a26da7c552003c2c4c597ac994f322475'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.7%2B10_openj9-0.20.0/OpenJDK11U-jdk_x64_mac_openj9_11.0.7_10_openj9-0.20.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_11.0.7_10_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.11-openj9.jdk'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.11-openj9.jdk'
end
