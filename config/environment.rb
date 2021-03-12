require 'bundler'
Bundler.require

module Concerns
end
require_relative '../lib/concerns/findable'


require_relative '../lib/artist.rb'
require_relative '../lib/song.rb'


require_all 'lib'
