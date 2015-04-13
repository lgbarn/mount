require 'spec_helper'

describe 'mount::create', :type => :define do
  let(:title) {'/my_test'}
  let(:params) { { :lvol => 'lvol1', :vg => 'vg01', :pvol => '/dev/hdc1', :size => '1Gib'} }

    it { should contain_mount__create('/my_test') }
#  context 'with defaults for all parameters' do
#    it { should contain_mount__create__mount_point }
#  end
end
