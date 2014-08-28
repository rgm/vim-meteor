module Meteor

  def self.test_alternate(path, base)
    new_path = case path
               when /\/app\//
                 path.gsub("/app", "/test/unit")
               when /\/test\/unit\//
                 path.gsub("/test/unit", "/app")
               end
    File.join(new_path, base)
  end

  def self.template_alternate(path, base)
    new_base = case base
               when /\.html$/
                 base.gsub(/\.html$/, ".js")
               when /\.js$/
                 base.gsub(/\.js$/, ".html")
               end
    File.join(path, new_base)
  end

  def self.find_alternate

    alternate_type = VIM::evaluate("a:type")
    opener         = VIM::evaluate("a:opener")

    fn             = VIM::evaluate('expand("%:p")')
    path, base     = File.split(fn)

    candidate = case alternate_type
                when 'test'
                  test_alternate(path, base)
                when 'template'
                  template_alternate(path, base)
                end

    VIM::command("#{opener} #{candidate}")

  end

  def self.find_template
    while ! File.directory?('.meteor') do
      Dir.chdir '..'
    end
    opener   = VIM::evaluate "a:opener"
    fragment = VIM::evaluate "a:fragment"
    pattern = %Q{<template name="#{fragment}"}
    candidates = `grep --recursive --files-with-matches --include "*.html" '#{pattern}' *`
    candidate = File.expand_path(candidates.split("\n").first.strip)
    opener = "vsplit"
    VIM::command("#{opener} #{candidate}")
  end

end
