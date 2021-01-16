control "cis-2-1-1" do                      
  impact 1.0                                
  title "2.1.1 Ensure xinetd is not installed (Scored)"
  desc "The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests."
  describe command('rpm -q xinetd') do
   its('stdout') { should match /package xinetd is not installed/}
  end
end
