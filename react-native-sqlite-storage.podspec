require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name     = "react-native-sqlite-storage"
  s.version  = package['version']
  s.summary  = package['description']
  s.homepage = "https://github.com/andpor/react-native-sqlite-storage"
  s.license  = package['license']
  s.author   = package['author']
  s.source   = { :git => package['repository']['url'], :tag => "v#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.preserve_paths = 'README.md', 'LICENSE', 'package.json', 'sqlite.js'
  s.source_files   = "src/ios/*.{h,m}"

  s.dependency 'React'
  s.dependency 'SQLCipher', '4.1.0'
  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1',
    'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2 -DSQLITE_SOUNDEX -DSQLITE_THREADSAFE -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_STAT3 -DSQLITE_ENABLE_STAT4 -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_ENABLE_MEMORY_MANAGEMENT -DSQLITE_ENABLE_LOAD_EXTENSION -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS4_UNICODE61 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_FTS5 -DSQLCIPHER_CRYPTO_CC -DHAVE_USLEEP=1 -DSQLITE_MAX_VARIABLE_NUMBER=99999'
  }
end
