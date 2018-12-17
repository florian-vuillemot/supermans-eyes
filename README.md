# supermans-eyes
School project {{ EPITECH }}

## Subject
You work in a school and you should control what you student make on internet and provide a private "cloud".

I can provide all subject for school licence reason. But I can list the requirements:

    - Block useless protocols and IPs that is not necessary for work in a school
    
    - Provide a private cloud with **OwnCloud** for students
    
    - Create a authentification for student
    
    - Provide a history of all internet search
    
The project is a POC. The proof of work is more important than block all useless protocols and useless website for a student ;)

## Technical part
The subject allow us to use PfSense and impose us Owncloud.
    
### Owncloud
For install OwnCloud go in Salt directory and follow the README.md.

After that you should allow connection from PfSense to OwnCloud by going in the config/config.php (in the web server application directory, here /var/www/owncloud) and add the IP **192.168.1.1** (Here the PfSense IP) in the `trusted_domains` variable (show https://doc.owncloud.org/server/10.0/admin_manual/configuration/server/config_sample_php_parameters.html for more information).

### PfSense
#### Installation
**Download PfSense**: https://www.pfsense.org/download/

For simulation you can install it on a VM with VirtualBox or VmWare for example. Don't forget to add a second network card. One for WAN connection and other for LAN connection. For the LAN connection, I recommand you to create a "Internal Network" on you machine and connect all other LAN computer on this network.

In real situation PfSense should be install on the only machine that will create the LAN and be connect to you internet provider.

For go on the PfSense configuration portal go on `192.168.1.1`. You can also use a SSH connection from the LAN (by default SSH is disable from WAN).

#### Block protocol
**Package**: None

**Resource**: https://www.netgate.com/docs/pfsense/book/firewall/configuring-firewall-rules.html

Go on Firewall > Rules > LAN and create a New Rules.

Thanks to "Action" obtion choose if you want allow/reject the protocol and make you configuration (Protocol, Address Familly, Destination, ...). When is done Save it and click on "Apply Changes" button for make the modification available.

Explaination: PfSense will rout all network from LAN to WAN. So if you block a protocol in LAN it will block the protocol to WAN. It will also protected protocol from WAN to LAN.

#### Block URL
**Package**: SquidGuard

**Resource**: https://www.netgate.com/docs/pfsense/cache-proxy/squidguard-package.html

When SquidGuard is install you should go in Services > Proxy filter SquidGuard.

1. go in Blacklist option and download a list of generic URL.

Ex: http://squidguard.mesd.k12.or.us/blacklists.tgz or http://www.shallalist.de/Downloads/shallalist.tar.gz

2. go in Common ACL option and choose the Target Rules. You can indicat a URL of redirection for backlist URL

3. Finally go on General Option and click on Enable and Apply buttons

Note: This should work. But be carefull because HTTPS could not work (show Improvement part in the bottom of the documentation).

#### Active DHCP
**Package**: None

**Resource**: None

Go on Service > DHCP Server and enable it.

You can configure you subnet and the range of IP provide. 

Do not forget to start after 192.168.1.2 that is the OwnCloud address.

#### Active DNS Resolver for OwnCloud
**Package**: None

**Resource**: None

Go on Service > DNS Resolver, enable it and add a Host Overrides.

Choose the Host name (owncloud for example), the parent domain of host (intra.foo for example) and the IP address.

#### Active the Captive Portal and create User
**Package**: Captive Portal (include)

**Resource**: https://turbofuture.com/computers/How-to-Set-Up-a-Captive-Portal-Using-pfSense

Go in Service > Captive Portal and click on Add.

After that configure your portal and don't forget to "Enable" it.

When configured you should create user for allow connection. For do that go on System > User Manager and add a user.

Note: Even without user you can continue to  go on the PfSense portal on `192.168.1.1`.

#### Conserve user research and logs
**Package**: LightSquid

**Resource**: https://turbofuture.com/computers/Monitoring-Internet-Usage-With-LightSquid-and-pfSense

Install the LightSquid package and go in the service (Status > Squid Proxy Reports: Settings).

Follow the instructions in the "instruction" part. When all is ok you can make a refresh with the "Refresh" button on the bottom of the page and when is done go on the links "Open Lightsquid". You should connection you again and after that you will show all the users logs in reports. You can also see logs in the logs directory directly on the PfSense server in the directory `logs` directory.

### Industrialisation
When you configuration is ok. Is a good choice to save you `config.xml` file. This file will allow you to make a back-up of you setting and will allow you to create a second PfSense machine in 2 click in case of disaster.

For more information: https://www.netgate.com/docs/pfsense/backup/configuration-backup-and-restore.html

## To improve
HTTPS is not working due to certificated problem. If PfSense catch connection between website and browser in HTTPS, the browser will catch it and stop the connection for security reason if the certificat is not recognized or signed by a tierce entity. You need a certificated signed for allow this interception. More information on: (https://turbofuture.com/internet/Intercepting-HTTPS-Traffic-Using-the-Squid-Proxy-in-pfSense).
