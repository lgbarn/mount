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

  describe 'mount::create define type' do
    describe file('/dev/vg01/lvol1') do
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 777 }
    end
    describe file('/mytest') do
      it { should be_mounted }
    end
    describe command('lvs -a /dev/vg01/lvol1 | grep lvol1 | awk "{print $4}"') do
      its(:exit_status) { should eq 0 }
      its(:stdout) { should contain '500.00m' }
    end
  end
end
