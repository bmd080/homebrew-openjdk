# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk14-openj9-jre-large' do
  version '14.0.1,7'
  sha256 '812a42862d2cf76ea1c11d659168f82221365e30bbca1b1f63adf62d4ccac4df'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.1%2B7_openj9-0.20.0/OpenJDK14U-jre_x64_mac_openj9_macosXL_14.0.1_7_openj9-0.20.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14 (OpenJ9) (JRE) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14U-jre_x64_mac_openj9_macosXL_14.0.1_7_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14-openj9.jre'
end
