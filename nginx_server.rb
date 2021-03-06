control "nginx-server" do                      
  impact 1.0                                
  title "Verify the configuration of nginx server."
  desc "Verify the configuration of nginx server on centos machine by running below describe blocks."

  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should_not be_running }
  end

  describe file('/var/lib/nginx') do
    its('owner') { should eq 'nginx' }
    its('group') { should eq 'root' }
  end  

  describe file('/etc/nginx/nginx.conf') do
    it {should exist}
  end 

  describe file('/etc/nginx/fastcgi.conf') do
    its('size') { should be > 100 }
  end    

  describe file('/etc/nginx') do
    it { should be_directory }
  end  
  
  describe file('/etc/nginx/nginx.conf') do
    it {should exist}
    its('content') { should include ('listen       80 default_server;') }
    its('content') { should include ('listen       443 ssl http2 default_server') }
  end
end 
