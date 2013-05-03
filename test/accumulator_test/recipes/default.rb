#
# Cookbook Name:: accumulator_test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

accumulator_test_foo "one" do
  arg "fish"
end

accumulator_test_foo "two" do
  arg "fish"
end

accumulator_test_foo "red" do
  arg "fish"
end

accumulator_test_foo "blue" do
  arg "fish"
end

template "/tmp/accumulator_test_target_1" do
  source "test_target_one.erb"
  action :nothing
end

accumulator "accumulator_test_1" do
  target :template => "/tmp/accumulator_test_target_1"
  filter Proc.new {|res| res.is_a? Chef::Resource::AccumulatorTestFoo }
  transform Proc.new {|resources|
    lines = []
    resources.each do |r|
      lines.push("#{r.name} #{r.arg}")
    end
    lines
  }
end
