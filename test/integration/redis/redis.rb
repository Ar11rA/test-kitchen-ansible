control "All the port have redis instances listening" do
  describe port(6379) do
    it { should be_listening }
    its('processes') {should include 'redis-server'}
  end

  describe port(6380) do
    it { should be_listening }
    its('processes') {should include 'redis-server'}
  end

  describe port(26384) do
    it { should be_listening }
    its('processes') {should include 'redis-server'}
  end

  describe port(26385) do
    it { should be_listening }
    its('processes') {should include 'redis-server'}
  end
  
  describe port(26386) do
    it { should be_listening }
    its('processes') {should include 'redis-server'}
  end
end

control "The master slaves are configured correctly" do
  describe command('redis-cli -p 6379 info | grep ^role') do
    its('stdout') {should eq "role:master\r\n"}
  end
  
  desc 'check if the connected redis node is slave and is online'
  describe command("redis-cli -p 6379 info | grep -E \"slave[0-9]\" | awk -F ',' '{print $2, $3}'") do
    its('stdout') {should eq "port=6380 state=online\n"}
  end
end

control "The sentinels are connected to master correctly" do
  describe command("redis-cli -p 26384 info | grep -E \"master[0-9]\" | awk -F ',' '{print $3, $4, $5}'") do
    its('stdout') {should eq "address=127.0.0.1:6379 slaves=1 sentinels=3\r\n"}
  end

  describe command("redis-cli -p 26385 info | grep -E \"master[0-9]\" | awk -F ',' '{print $3, $4, $5}'") do
    its('stdout') {should eq "address=127.0.0.1:6379 slaves=1 sentinels=3\r\n"}
  end

  describe command("redis-cli -p 26386 info | grep -E \"master[0-9]\" | awk -F ',' '{print $3, $4, $5}'") do
    its('stdout') {should eq "address=127.0.0.1:6379 slaves=1 sentinels=3\r\n"}
  end
end

control "Sentinels change configuration on a failover" do
  slave_master_result = command("redis-cli -p 26386 --csv sentinel slaves redis").stdout
  new_result = {}
  sanitated_info = slave_master_result.split(',').map{|element| element[1..-2]}
  sanitated_info.each_with_index.inject({}) do |result, (element, index)|
    result[element] = sanitated_info[index + 1] if index%2==0
    new_result = result
    result
  end

  describe "The master IP and port #{new_result['master-host']}:#{new_result['master-port']} before failover" do
    it {should match /127.0.0.1:6379/}
  end

  describe "The slave IP and port #{new_result['name']} before failover" do
    it {should match /127.0.0.1:6380/}
  end


  # command("redis-cli -p 26386 sentinel failover redis").stdout
  # sleep(5)

  # slave_master_result = command("redis-cli -p 26386 --csv sentinel slaves redis").stdout
  # new_result = {}
  # sanitated_info = slave_master_result.split(',').map{|element| element[1..-2]}
  # sanitated_info.each_with_index.inject({}) do |result, (element, index)|
  #   result[element] = sanitated_info[index + 1] if index%2==0
  #   new_result = result
  #   result
  # end

  # describe "The slave IP and port #{new_result['name']} before failover" do
  #   it {should match /127.0.0.1:6379/}
  # end

  # describe "The master IP and port #{new_result['master-host']}:#{new_result['master-port']} before failover" do
  #   it {should match /127.0.0.1:6380/}
  # end
end



