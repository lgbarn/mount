require 'spec_helper_acceptance'

describe 'mount class' do
  describe 'apply mount module' do
    it 'should apply with no errors' do
      pp = <<-EOS
      class { 'mount': }
      mount::create {'/mytest':
        lvol => 'lvol1',
        vg   => 'vg01',
        pvol => '/dev/sdb',
        size => '500M',
      }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
  
end
