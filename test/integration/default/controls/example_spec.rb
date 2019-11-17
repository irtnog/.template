# frozen_string_literal: true

# Overide by OS
root_dir = '/'
root_dir = 'c:\\windows' if os[:family] == 'windows'

control 'root directory' do
  title 'should be present'

  describe directory(root_dir) do
    it { should exist }
    it { should be_directory }
    it { should be_allowed('read') }
  end
end
