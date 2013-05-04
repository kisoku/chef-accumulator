#
# Author:: Mathieu Sauve-Frankel <msf@kisoku.net>
# Copyright:: Copyright (c) 2012 Mathieu Sauve-Frankel
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
