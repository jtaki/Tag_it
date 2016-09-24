# coding: utf-8
lib = File.expand_path('../lib',__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Tagit"
  spec.version       = '1.0'
  spec.authors       = ["Jeff Takiguchi"]
  spec.email         = ["jefftakiguchi@gmail.com"]
  spec.summary       = %q{short summary of project}
  spec.description   = %q{longer description of project}
  spec.homepage      = ""
  spec.files         = ['lib/tagit.rb']
  spec.executables   = ['bin/tagit']
  spec.test_files    = ['tests/test_tagit.rb']
  spec.require_paths = ['lib']
end
