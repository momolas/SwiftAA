Pod::Spec.new do |s|
  s.name         = "SwiftAA"
  s.version      = "2.5.0"
  s.summary      = "The most comprehensive and accurate collection of astronomical algorithms in Swift."

  s.description  = <<-DESC
SwiftAA aims at providing the most comprehensive collection of accurate astronomical algorithms in Swift.
That is, based on the reference textbook "Astronomical Algorithms" by Jean Meeus, SwiftAA provides modern
APIs about all things astronomical. It is based on the C++ layer developed since many years by J.P. Naughter.
SwiftAA is built upon this C++ layer, on top of which a modern and expressive API is crafted. It is also
heavily covered by unit tests, in order to become the most reliable source of astronomical computations.
  DESC

  s.homepage     = "https://onekiloparsec.dev"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Cédric Foellmi" => "cedric@onekiloparsec.dev" }

  # --- Deployment targets ---
  s.ios.deployment_target     = "17.0"
  s.osx.deployment_target     = "14.0"
  s.watchos.deployment_target = "10.0"
  s.tvos.deployment_target    = "17.0"

  # --- Source ---
  s.source = {
    :git => "https://github.com/onekiloparsec/SwiftAA.git",
    :branch => "master"
  }

  # --- Language & framework ---
  s.framework      = "Foundation"
  s.swift_versions = ["5.10"]

  # --- Source files ---
  s.source_files = [
    "Sources/SwiftAA/**/*.swift",
    "Sources/AABridge/**/*.{h,cpp}"
  ]
  s.exclude_files = [
    "Sources/SwiftAA/**/SwiftAA.playground/**/*",
    "Sources/SwiftAA/**/Tests/**/*"
  ]

  # --- Compiler & linking options ---
  s.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
    "CLANG_CXX_LIBRARY" => "libc++",
    "OTHER_LDFLAGS" => "-lc++"
  }

  s.library = "c++"
end
