control "nginx-server" do                      
  impact 1.0                                
  title "Verify the configuration of nginx server."
  desc "Verify the configuration of nginx server on centos machine."

  # Verify that nginx is installed
  
  describe package('nginx') do
    it { should be_installed }
  end

  # Verify that nginx is not running

  describe service('nginx') do
    it { should_not be_running }
  end

  # Verify that owner and group is root

  describe file('/var/lib/nginx') do
    its('owner') { should eq 'nginx' }
    its('group') { should eq 'root' }
  end  

  # Verify that nginx.conf exists in location /etc/nginx/nginx.conf

  describe file('/etc/nginx/nginx.conf') do
    it {should exist}
  end 

  # Verify that size of file fastcgi.conf is greater than 100

  describe file('/etc/nginx/fastcgi.conf') do
    its('size') { should be > 100 }
  end    

  # Verify that directory /etc/nginx exists.

  describe file('/etc/nginx') do
    it { should be_directory }
  end  

  # Verify that file nginx.conf contains required content.
  
  describe file('/etc/nginx/nginx.conf') do
    it {should exist}
    its('content') { should include ('listen       80 default_server;') }
    its('content') { should include ('listen       443 ssl http2 default_server') }
  end
end 
