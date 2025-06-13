<p align="center">
  <img src="https://i.imgur.com/To5m6ej.png" alt="Mike">
</p>

> *“Alright, sit down.\
> I'm not gonna repeat myself.\
> You do it my way, you'll be fine.\
> You take a shortcut, and you're on your own.”*

I'm not here to hold your hand. I'm here to tell you how to not mess this up.\
You do it right, you won't hear from me again. 

# 📋 Mike's Checklist

Your job is to give the evaluators nothing. Make their job boring as they check every little box off their list.

## ✅️ The Signature

> Don’t trust a clean boot. Trust a snapshot.

B2BR's subject asks for one file in your repository: `signature.txt` and that's exactly what you give it, nothing else.

1) Shutdown the machine and take a **snapshot** of it in VirtualBox (I'll explain why)
2) Go to the folder where your VM is stored
3) Use the command `shasum yourVM.vdi`. This will take a moment so be patient
4) Once it outputs the hash, copy it inside the file `signature.txt` and you are ready for evaluation

The hash of your .vdi file is like a fingerprint. It makes sure that your VM remains unchanged between when you finished the project and when you are being evaluated.
 
 The first thing the evaluators will do is check the hash against that `signature.txt` you sent, so **don't screw this up.**


<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/JOqnGGv.png" alt="Snapshot" width="300">
    </td>
  </tr>
  <tr>
    <td align="center">
      You will have 3 evaluations and that fingerprint we have discussed may change.</br>
      So, to ensure the hash always corresponds to the signature, take a snapshot.
    </td>
  </tr>
</table>

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/ex3aDwm.png" alt="Snapshot Restore" width="300">
    </td>
  </tr>
  <tr>
    <td align="center">
    And before each evaluation just restore it.
    </td>
  </tr>
</table>

## ✅️ The Machine: OS and hostname

- The PRETTY_NAME should say "Debian" and the codename of the latest stable version (for example bookworm for debian 12)
```shell
cat /etc/os-release
```

- The static hostname should be **yourlogin42**
```shell
hostnamectl
```
> <sup>`ctl` = control</sup>

And in case you need, you can still change it:

⚠️ <ins>Remember this for evaluation too</ins>

During evaluation you may be asked to change the hostname.

1. Modify the hostname with this command
```shell
hostnamectl set-hostname yournewhostname
```

2. Change the hostname also in `/etc/hosts`

3. Restart the VM

## ✅️ The Partitions

```shell
lsblk
```
> <sup>`ls` = list & `blk` = block (devices)</sup>

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/asnrjY2.png" alt="lsblk" width="559">
    </td>
  </tr>
  <tr>
    <td align="center">
    Make sure that you have at least 2 encrypted <b><ins>partitions</ins></b> using LVM (partitions, not separate disks)
    </td>
  </tr>
</table>

<details>
  <summary><ins>Be prepared in case you have to explain what <code>PV</code>, <code>VG</code> and <code>LV</code> mean.</ins></summary>
  
  - <b>P</b>hysical <b>V</b>olumes: the base layer of LVM, here it's `/dev/sda5` which has been initialized for use by LVM
  
  - <b>V</b>olume <b>G</b>roup: it pools together one or more PV into a single storage space.\So basically, once you have the encrypted PV, you create a VG (`LVMGroup`)
    
  - <b>L</b>ogical <b>V</b>olumes: a virtual partition created from a VG. This is where you'll mount your actual filesystems such as root `/` and `/home`
</details>

<details>
  <summary><ins>Or to talk about encryption</ins></summary>
  
  - In the example you can see that only the partition `/dev/sda5` is encrypted.\
    This partition contains the logical volumes (root, home...) and is encrypted using **LUKS** to protect the user data.
    
  - The `/boot` partition (`/dev/sda1`) is unencrypted because it contains the kernel and other components that are required at boot time before LUKS decryption can be done.
</details>

## ✅️ Users and groups

- Verify that sudo is properly installed on the VM
```shell
dpkg -l | grep sudo
```
> <sup>`dpkg` = debian package</sup>

- Manually check the password policy by creating a new user
```shell
# add the user
adduser newuser

# change the password and check if the rules are active
passwd newuser
```

- Verify the password expiration policy
```shell
chage -l user

# check for root too
chage -l root
```

- Check that your user (with your 42 login) belongs to the groups `sudo` and `user42` 
```shell
#check for sudo
getent group sudo

#check for user42
getent group user42
```
> <sup>`getent` = get entries</sup>

- During evaluation you may be asked to create a new group and assign it to a user
```shell
# creating the group "cleanup" for example
groupadd cleanup

#adding the user "mike" to the group "cleanup"
usermod -aG cleanup mike
```
> <sup>`usermod` = user modify / `-a` = append to existing groups` / `-G` sets the user's list of extra groups</sup>
> 
Using `-G` without `-a`, Mike would be removed from all other groups and only belong to cleanup.

## ✅️ Sudo logs

### <ins>If you followed what Saul taught you about logging `sudo` activity (I/O Logging):</ins>

- Check the existence of the folder `/var/log/sudo/` and that it's not empty if you ran at least 1 sudo command
```shell
ls -l /var/log/sudo/
```

- Run a new command and check if the `seq` files incremented (it's in base 36) and if it created new log entries inside the folders.

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/PiIK2Fv.png" alt="seq" width="500">
    </td>
  </tr>
  <tr>
    <td align="center">
      base36 so <code>00000V</code> = 31 and <code>00000W</code> = 32
    </td>
  </tr>
</table>

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/HISqPr8.png" alt="seq" width="1100">
    </td>
  </tr>
  <tr>
    <td align="center">
      Each sudo command is assigned a folder inside <code>00/00/</code> and you can access the file `log` for information  
    </td>
  </tr>
</table>

### <ins>If you used Syslog:</ins>

First, you're missing out. Using I/O logging is more advanced, more secure and more aligned with what Born2BeRoot requires.

But it's simpler to check so you just verify the existence and successful login inside this file:
```shell
cat /var/log/sudo/sudo.log
```

## ✅️ SSH is SECURE

- The only way from the outside should be port `4242`
```shell
ss -tlpn | grep sshd
```

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/vkfd4R7.png" alt="sshd" width="600">
    </td>
  </tr>
  <tr>
    <td align="center">
      Prove the port is listening where it should
    </td>
  </tr>
</table>

- Root shouldn't be able to get in
```shell
# Run this from your own computer, not the vm
ssh root@localhost -p 2222
```

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/fawKe46.png" alt="root denied" width="400">
    </td>
  </tr>
  <tr>
    <td align="center">
      (Port 2222 is forwarded to 4242 as Saul explained)
    </td>
  </tr>
</table>

- Now try connecting with your username on the correct port\
You're in? Good, if you want to get out of here, use the command `logout`.

## ✅️ UFW doing its job

- Check that it's running.
```shell
ufw status
```

- Verify the rules

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/jSsRpFY.png" alt="ufw status" width="500">
    </td>
  </tr>
  <tr>
    <td align="center">
      Ports 80 (http) and 19999 (netdata for the service of choice) are used for the bonus part
    </td>
  </tr>
</table>

<ins>⚠️ During evaluation you might be asked to add and remove new rules</ins>
  
  - To allow, for example, port 10000, just type the command `ufw allow 10000`
  
  - To remove it however, you'll first have to use `ufw status numbered`. So that it shows the ID number for each rule between the `[ ]`
    
  - In my case, the ID of the rule allowing 10000 is 8 so I simply use `ufw delete 8`

---

🚧👷 **UNDER CONSTRUCTION**
     
> Other tips and checks will be added...

