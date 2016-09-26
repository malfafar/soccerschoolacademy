Normal
--------------------------------------------------------------------------

```
adduser deployer

echo "deployer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
service ssh reload
cp -R /root/.ssh/ /home/deployer/
chown -R deployer:deployer /home/deployer/.ssh/
sudo locale-gen pt_PT.UTF-8
```



Create user with password
--------------------------------------------------------------------------

```
adduser deployer

echo "deployer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
service ssh reload
sudo locale-gen pt_PT.UTF-8
```


Create user with ssh
--------------------------------------------------------------------------

```
adduser deployer

echo "deployer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
service ssh reload
cp -R /root/.ssh/ /home/deployer/
chown -R deployer:deployer /home/deployer/.ssh/
sudo locale-gen pt_PT.UTF-8
```