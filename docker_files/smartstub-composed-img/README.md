## docker composed app

Image with application:
- centos 7
- oracle java 8 (jdk-8u102-linux-x64)
- smart-stab jar 
	-- application directory: /usr/smartstab
	-- application logs: /usr/smartstab/logs
    -- ports 8080 and 9090 is exposed outside of the container
    -- external configs are added to /usr/smartstab/config
