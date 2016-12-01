## Full suite image (smartstub-full-img)
Image that contains all required components for running an application:
- oracle java 8 (jdk-8u102-linux-x64)
- postgresql 9.6
	-- port 5432 is exposed outside of the container, so the external clients can connect to database
	-- data directory: /var/lib/pgsql/data
	-- server logs: /var/log/pgsql/logfile
- smart-stab jar 
	-- application directory: /usr/smartstab
	-- application logs: /usr/smartstab/logs
    -- port 8080 is exposed outside of the container

## HOWTO:

- Build new image with smart-stab  application:
    ```bash
    # current location
    $ pwd
    <path>/smartstub-full-img
    # copy smart-stub.jar into current directory, so it must exists here
    $ ls smart-stub.jar
    smart-stub.jar
    # build image
    docker build -t your_img_name .
    ```
- Run container 
    ```bash
    docker run -d --name name_of_container your_img_name 
    ```