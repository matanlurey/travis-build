require 'spec_helper'
require 'travis/build'

describe 'Event' do
  describe 'name' do
    it 'returns "job:test:started" for a start event on a clojure test job' do
      job = Travis::Build::Job::Test::Clojure.new(nil, nil, nil)
      event = Travis::Build::Event.new(:started, job, nil)
      event.name.should == 'job:test:started'
    end

    it 'returns "job:test:started" for a start event on a ruby test job' do
      job = Travis::Build::Job::Test::Ruby.new(nil, nil, nil)
      event = Travis::Build::Event.new(:started, job, nil)
      event.name.should == 'job:test:started'
    end

    it 'returns "job:test:ruby:started" for a start event on a configure job' do
      job = Travis::Build::Job::Configure.new(nil, nil)
      event = Travis::Build::Event.new(:started, job, nil)
      event.name.should == 'job:configure:started'
    end
 end
end