require 'spec_helper'

# Generators are not automatically loaded by Rails
require 'generators/rspec/observer/observer_generator'

describe Rspec::Generators::ObserverGenerator, :type => :generator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../../../tmp", __FILE__)

  subject { file('spec/models/posts_observer_spec.rb') }
  before do
    prepare_destination
    run_generator %w(posts)
  end

  describe 'the spec' do
    it { is_expected.to exist }
    it { is_expected.to contain(/require 'rails_helper'/) }
    it { is_expected.to contain(/^RSpec.describe PostsObserver, #{type_metatag(:observer)}/) }
  end
end
