<p align="center">
  <img src="https://i.imgur.com/ZeWstf3.png" width="150" alt="B2BR Badge With Bonus">
</p>

<div align="center">

[![42 School](https://img.shields.io/badge/Paris-blue?logo=42&logoColor=fff)](https://42.fr/en/homepage/)
[![Bonus](https://img.shields.io/badge/✔️_Bonus-5cb85c)](https://github.com/baderelg/Born2beRoot) \
<img src="https://i.imgur.com/HTci8UV.png" width="100" alt="Validation confirmation on the 42 Intra @baelgadi - Jun 5th 2025"> \
[![Validation date](https://img.shields.io/date/1747144800?label=&style=for-the-badge&color=5cb85c)](https://github.com/baderelg/Born2beRoot)

</div>

<h3 align="center">
  <a href="https://github.com/baderelg/Born2beRoot/tree/main/Evaluation_tips.md">Evaluation Tips (by Mike Ehrmantraut) »</a>
</h3>

<br>

> [!NOTE]
> <details>
> <summary><strong>What is 42?</strong></summary>
>   
> > [42 School](https://42.fr/en/homepage/) is a coding school focused on peer to peer learning and being project driven. \
> > We are given a project, a set of rules and clear objectives, and then it's up to us to figure out how to achieve the goal. \
> > It pushes to learn how to learn. It may be intense and sometimes frustrating but the sense of accomplishment makes everything worth it. \
> > Short term comfort is thus sacrificed for long term growth and versatility.
> </details>
> 
> <details>
> <summary><strong>What is Born2BeRoot?</strong></summary>
> 
> > B2BR is the first system administration project in the 42 core curriculum.\
> > The goal is to set up and configure a secure Linux server on a virtual machine, operating entirely from the Command Line Interface and following a strict set of rules.\
> > Students must handle a wide range of tasks:
> > - **Virtualization**: set up and configuration of a vm using a hypervisor (VirtualBox)
> > - **OS installation**: choosing between Debian and Rocky Linux, and NOT using a graphical user interface
> > - **Security**: implementing a strict password policy, setting up a firewall (UFW) and learning about some security modules like AppArmor
> > - **User and permission management**: creating users and groups, configuring `sudo` with rules
> > - **Services and networking**: learning about and configuring SSH
> > - **Scripting**: creating a shell script that monitors the server's health and sends messages to all logged in users every 10 minutes
> > - **(BONUS) Functional web service**: building upon the secure foundation and setting up a fully functional web server to host a WordPress site by using a web server (`Lighttpd`), a database (`MariaDB`) and PHP
> </details>
> 
> To make the journey entertaining, I chose to approach the project through the eyes and voice of a fictional character.
> 
> <details>
> <summary><strong>Why ?</strong></summary>
> 
> > Embodying a character while tackling a project isn't just entertaining, it forges stronger connections with the logic and makes it way more engaging.</br>
> > When you try expressing what you just learned with the voice of a fictional character, it helps cementing the newly acquired knowledge and even adds new perspectives.</br>
> > 
> </details>
> <details>
> <summary><strong>Why Saul Goodman?</strong></summary>
> 
> > B2BR is about building a defense case for a server.\
> > It requires navigating a labyrinth of strict rules and setting up defenses against attacks, while ensuring every piece of the configuration is good enough.\
> > Saul Goodman thrives in a world like this, so who better to argue the server's case and find every loophole to ensure a perfect score?\
> > Also, the "better call sudo" wordplay. (actually the main reason 🤫)
> </details>

> [!WARNING]
> **This is not a tutorial on how to do Born2BeRoot.**\
> This is just some information I gathered when doing the project myself. And some advice to ace the evaluation.\
> Some may even be wrong so feel free to reach out if you find any mistake.

---


<p align="center">
  <img src="https://i.imgur.com/p8td3QU.png" alt="Its all good man">
</p>

> Alright, pull up a chair, let’s talk. You’ve got this… situation. This "Born2BeRoot" affair of yours. Sounds heavy, right? But lemme tell ya, with the right representation - someone I like to call "moi" - we can turn this interrogation into a victory parade. Ready ?

You came to me, Saul Goodman, and that's the first in line of your smart moves. I've seen everything, the good, the bad and the "it needs a complete system overhaul before the evaluator sees it".\
We're not just gonna pass, we're gonna own this project. Make it sing and dance, right?

This is your big debut. Let's get you ready for the spotlight and consider this case file your roadmap to ~~acquittal~~ acclaim.


# ⚖️ BETTER CALL SUDO! Your solid defense for B2BR

Imagine this whole Born2BeRoot thing is just like building a fortress.\
You wouldn't build your dream house on quicksand, would ya ? You need the right materials and a damn good architect who knows where the building inspectors (your evaluators) will poke their noses.

## 🌐 The Off-Shore Account - Setting up your VM

> First things first, we need a clean and secure place where to conduct our... business.

### ➢ What in God's name is a VM, Saul?

Think of it like this: Your main computer? That's your home.\
You can't conduct risky experiments in the living room now, would ya? <b>Of course not!</b> You would get spaghetti code all over the good old china.

<b>A Virtual Machine (VM)</b> is your secret lab. A whole damn computer - operating system, hard drive, the works - running inside your actual computer.\
The beauty of it? If you accidentally, let's say, reformat the "evidence room". POOF! The VM takes the hit and not your precious personal files or that embarrassing browser history we <i>don't</i> talk about.


<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/rODg02f.png" alt="VirtualBox" width="400">
    </td>
  </tr>
  <tr>
    <td align="center">
      ✨ And the magic wand that makes all of that happen? A <b>Hypervisor</b>. Something like <b>VirtualBox</b>
    </td>
  </tr>
</table>

Think of VirtualBox as the general contractor for this digital hideout we're building.\
It builds the walls, installs the (virtual) plumbing and makes sure, honest to God, that your little server has a cozy place to live in, completely oblivious that it's just a guest in your physical machine's world...\
All smoke and mirrors. And it's... beautiful!

### ➢ Choosing your wheelman - The Operating System

Alright, your secret lab is now framed out. Now it needs an identity.\
This is your <b>Operating System (OS)</b>. The project nudges you towards <b>Debian</b> or one of its cousins like Rocky Linux.

<table align="center">
  <tr>
    <th align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Openlogo-debianV2.svg/1200px-Openlogo-debianV2.svg.png" alt="Debian" width="20"> Debian</th>
    <th align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Rocky_Linux_logo.svg/2048px-Rocky_Linux_logo.svg.png" alt="Rocky" width="20"> Rocky Linux</th>
  </tr>
  <tr>
    <td align="center">Reliable and time-tested<br>Ideal for 42 projects</td>
    <td align="center">More corporate-oriented</td>
  </tr>
  <tr>
    <td align="center">Stable, well documented</td>
    <td align="center">Can be a bit flashier, newer</td>
  </tr>
  <tr>
    <td align="center">Less friction, more support</td>
    <td align="center">May need more setup effort</td>
  </tr>
</table>

Piece of advice, straight from the Goodman playbook: go with <b>Debian</b>. Why?\
Because Debian is that reliable seen-it-all wheelman. It's been around the block a thousand times, it's stable and it doesn't draw unnecessary attention.\
If you want to go flashy just go to Vegas, but if you want to pass the project well then you want dependable.\
Rocky is fine but maybe trying a little too hard. For our purposes Debian is the path of least resistance and believe me, you want that path!

> [!TIP]
> The subject asks to download the **stable** version for Debian.\
> Unstable versions are always codenamed Sid.\
> If it's named after another character from Toy Story then it's either stable *(for example debian 12 is Bookworm)* or testing.\
> [Double check just in case.](https://www.debian.org/releases/)

### ➢ What's in a Name? Everything

Alright, one last thing before you go on. Your server needs a name, an identity, a **hostname**.\
It's how it introduces itself to every other device on the network.

The B2BR subject is very specific on this point: the hostname MUST be your 42 login followed by 42. (for example `sgoodman42`)

You can usually set this during the installation but let's be honest. Sometimes you are moving so fast that things get overlooked.\
If you ever find yourself with the wrong name, don't panic: fixing is easy and I know a guy.

```shell
sudo hostnamectl set-hostname login42
```
TADA!

Oh and bonus points if you also make sure the name is right in your `/etc/hosts` file.\
It's good housekeeping and keeps the whole operation smooth.

## 🥧 Slicing the pie - Disk Partitioning & LVM

> Don't get greedy, get smart!

So you've got your OS. And now we gotta talk about storage (the virtual hard disk).\
You can't just throw all your files into one big digital shoebox. That's amateur hour for god's sake. We need organization, we need... <b>partition</b>.

### ➢  Why can't I just dump everything in one big pile, Saul?

Woah there cowboy! Your server your rules, yes, but up to a point.\
Think of it like your finances: You don't keep your grocery money, your "entertainment" budget and your emergency escape fund all in the same sock under a mattress, now, do you? (if you do, we need to have another talk).

<b>Partitioning</b> is about dividing that disk into logical sections. 
- One for the OS itself (the `/` or root partition)
- for the user data (`/home`)
- for system logs (`/var/log`)
- for temporary files (`/tmp`)
- for service data (`/srv`)
- for configuration files (`/etc`)
- ...

### ➢  What is LVM?

`Logical Volume Management` (LVM) is a method of allocating space that is more flexible than traditional partitioning.\
It takes multiple physical hard drives and groups them together into one single, **MASSIVE** pool of storage space.\
From this pool you can create and resize your partitions however you like.

Traditional partitioning is like building concrete rooms: you'll need a jackhammer to change it.\
LVM, on the other hand, adjusts space with a simple swap. Need more room for `/home` or `/var`? No demolition necessary. Just resize on the fly.

## 🦸‍♂️ Who is the boss? - Users and the Almighty root

Your server is taking shape. It's got organized storage and now who gets the keys?\
We need to talk about users and privileges.

### ➢  Root? Regular Users? What the hell is this Saul?!

Yes. There is a hierarchy.

- `root` is the CEO. It can do anything. And that's precisely why you don't log in as `root` for everyday tasks.\
It's too much power, too much risk.\
One wrong command as `root` and you can accidentally nuke your whole god damn setup. So you better think of `root` as the nuclear launch codes: you keep them locked away until the server starts testifying against you.

- **regular user accounts**. This is you and your trusted lieutenants, the day to day operators.\
These users have permissions to do most normal things but they can't, let's say, rip out the server's heart without special permission.\
It's called **the principle of least privilege**: don't walk around with more power than you need for the task at hand. Keeps you from shooting yourself in the foot!

### ➢  Assembling the crew (user groups)

You may have your users but you can't just have a bunch of lone wolves running around. You need crews, you need **groups**.

Think of it this way: instead of giving every guy a key to every room, you just give him a membership card to a club.\
The club has the keys.\
By putting a user in a group, you're giving them all the permissions: revoke someone's club membership and poof, their access is gone, just like that.

For B2BR the subject insists that you create a group called `user42` so think of it as your main crew.\
You'll need root access to run the necessary commands for creating and assigning groups, but there is another way...

### ➢  Sudo - The Goodman special

So what happens when the regular users need to do something that requires privileges they actually don't have? Say installing software or changing some critical system files?\
Do I log in as root? AMATEUR MOVE. Too risky.

<table align="center">
  <tr>
    <td align="center">
      <img src="http://i.imgur.com/OyEHGQu.png" alt="SUDO" width="150">
    </td>
  </tr>
  <tr>
    <td align="center">
        That's where you better call <b>sudo</b> (<b>S</b>uper <b>U</b>ser <b>DO</b>).
    </td>
  </tr>
</table>

This is your temporary hall pass to the principal's office.

- You type `sudo` before a command and then the system asks for YOUR password (not the root one) and if you're authorized (user is in the sudo group) the command runs with root privilege.

Why this is so great?

- **Accountability** because every time you use sudo it's logged. So the system keeps record of who did what and when.
- **Security** because you're not constantly logged in as `root`. So it's less exposure.

### ➢  Sudo Rules - The Goodman clause

Giving out root access is like giving the keys of your brand new Cadillac to your drunk cousin. A recipe for disaster.

Everything is managed inside `/etc/sudoers` which you can also access by just typing `visudo` on your terminal.

```shell
# You get three shots. 3 strikes and you're OUT
Defaults passwd_tries=3

# Display an insult message if someone messes up (humiliation is a deterrent after all)
Defaults badpass_message="You just failed your bar exam in sudo. Wanna pass? You know who to call."

# All sudo commands must be logged
Defaults log_input
Defaults log_output
Defaults iolog_dir=/var/log/sudo/

# Limit the paths used by sudo to run commands. No wandering off into dark alleys
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Only allow TTY (being logged on a real terminal), we are not animals
Defaults requiretty
```

> [!TIP]
> If `iolog_dir=/var/log/sudo/` is set and the directory doesn't exist, sudo logging will fail.
> Create the `var/log/sudo/` directory and set proper permissions to avoid any bad surprise.
> ```shell
> sudo mkdir /var/log/sudo/
> sudo chown root:root /var/log/sudo/
> sudo chmod 700 /var/log/sudo/
> ```

## 📦 Acquiring assets - Package Management with APT

Alright. You need the right tools for the right job, ok?

So right now your server is basically an empty warehouse. To get anything done, you need to bring in some mmh... *assets*.\
In the world of Debian, that means managing software packages, and one of my guys takes care of everything you need. Have you met `apt`?

### ➢ But Saul, what is this APT?

Think of `apt` (**A**dvanced **P**ackage **T**ool) as my guy on the inside. You tell him what you need (`apt install software`) and he goes out on the field, finds the exact right package, handles all the dependencies (the "friends" he'll need to bring along the way) and gets it installed for ya. Clean, simple, no drama.

He's also the guy you call to update your existing gear (`apt update`).

You might also hear whispers on the street about his older cousin `aptitude`. So what's the difference?

### ➢ APT vs Aptitude

`aptitude` is a *senior partner*. He does everything `apt` does but he's a slick negotiator that one.\
When you run into a messy situation where two packages have beef (dependency conflict), `aptitude` will try to find a solution to make everyone happy. `apt` is more likely to just tell you it can't be done.\
`aptitude` also has a full interactive mode.

<ins>For B2BR's purposes `apt` is all the muscle we need.</ins> He's reliable, he's straightforward, and he's on every Debian system by default.\
Stick with it and **K**eep **I**t **S**imple **S**tupid.

## 🚪 The one who knocks - SSH

All users are configured. Great. But it's like having a secret clubhouse with no door.\
How do you manage it? Tell it what to do? From a distance?\
Three letters my friend: `SSH` (**S**ecure **SH**ell)

### ➢  SSH - More than three letters, it's your lifeline

SSH doesn't just knock. It picks the lock and lets you slide into your server like you own the place. (well in this case you actually do)\
It's like whispering secrets in a language only you and the server understand.\
Username into password and boom. You're in.\
It's encrypted, authenticated and admissible in court. Capische?

SSH is your encrypted tunnel. Your private secure connection from your computer to the server, even if it's halfway across the world (or just sitting in the virtual window).

### ➢  Changing ports

Now, by default SSH listens on **port 22**. Every digital peeping Tom knows this.

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/ZY0MyeK.png" alt="ROB ME" width="150">
    </td>
  </tr>
  <tr>
    <td align="center">
        If you're gonna leave it on port 22 then you might as well put a giant "ROB ME" sign on your server's front door.
    </td>
  </tr>
</table>

So what to do, you might ask? <ins>We change the port!</ins>

Just pick a number. something high up and random (but not already used by another service!).\
Think of it as if you're moving the entrance from Main Street to a door in the back alley, maybe even the one behind that rusty dumpster.\
Fewer unwanted visitors will find it but a determined adversary can still scan for open ports.\
Still, it filters out a lot of the automated worthless riff-raff and that's good enough for now.

> [!TIP]
> The B2BR subject requires to change the port to 4242 anyway.\
> However, 4242 will probably not work as it's already used on other services. Therefore, you'll need to forward it to another port like 2222 for example.

### ➢ Laying down the house rules - `sshd_config`

Every good establishment has a rulebook: a list of who is allowed in.\
For SSH it's `/etc/ssh/sshd_config`. This is where you turn your server from a public park bench into a private gentleman members-only club.\
Keep in mind that you will need `sudo` to make changes here...

**1- Change the secret knock (the port)**\
We already agreed that leaving SSH on port 22 is ludicrous.\
You'll find a line that says `#Port 22`. First you uncomment it by removing the `#` and then change 22 to a new number. (4242 in B2BR)

**2- No VIPs even at the backdoor**\
This one is a non-negotiable by B2BR.\
Think of `root` as the CEO. You never let the boss use an exposed entrance. It's too risky!\
By setting the rule `PermitRootLogin no` you ensure that it is impossible to log in directly as `root` from the outside.

## 🛡️ YOU SHALL NOT PASS! - UFW

Your server is now accessible via a secret port. That's nice but the internet is a jungle.\
A lot of weirdos can try to jiggle your server's doorknobs and we need protection. We need a **firewall**.

### ➢  What's a firewall Saul?

A firewall is basically a digital security guard.

It stands at the main entrance to your server and inspects all incoming and outgoing traffic.\
It has a set of rules and even a guest list if you want it to.
- 🟢 **ALLOW** If the traffic matches this rule then it gets in.
- ⛔ **DENY** It gets the boot.

Now firewalls can be complicated beasts and the real judge is `iptables`.\
This is the one who makes the decisions and blocks or allows traffic.\
Writing rules into iptables is like arguing a case in latin. But guess what?

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/XI9svyE.png" alt="UFW" width="800">
    </td>
  </tr>
  <tr>
    <td align="center">
        That's where UFW comes in and talks to iptables for you.
    </td>
  </tr>
</table>

Yes. `UFW` (**U**ncomplicated **F**ire**W**all) is your best friend. Well second best friend, right after me.\
It's in the name! UNCOMPLICATED. It's designed to be easy to configure so it's really effective.\
You say "deny 6667" and BOOM! It makes it happen.

### ➢  Setting the rules - Who gets in and who gets the heave-ho.

UFW is your first line of defense. The evaluators WILL test it, trust me!

- **Deny by default**\
  First rule of the firewall club: block everything coming unless you specifically allow for it to enter. This is your nightclub and you have a very exclusive list.
- **Allow SSH**\
  I mean, obviously. So tell UFW to let you get in. (In B2BR this is port 4242)
- **Allow Web traffic**\
  If you're planning or running a website (doing the bonus) then you'll need to allow traffic on port 80 (HTTP)
  
## 🕺🏻 U Can’t Touch This - AppArmor

Alright. So now you got UFW watching the door, right? Fantastic.\
But what about the guys already inside?

What is stopping, say, a seemingly legitimate program from having a little too much to drink and deciding on a whim to trash the whole place?\
That, my friend, is where **AppArmor** comes in.

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/IHtXsg1.png" alt="AppArmor" width="600">
    </td>
  </tr>
  <tr>
    <td align="center">
        Think of AppArmor as an ankle monitor for every application on your server. </br>Makes sure that no one goes wandering off beyond their boundaries.
    </td>
  </tr>
</table>

### ➢  But Saul... How does it work?

AppArmor works with "profiles". Think of 'em as parole conditions for each program.\
Now a profile dictates EXACTLY what a program can read or write, and what network connections can be made by it.\
It's tailored for each potential troublemaker: If your web server gets the bright idea of reading your password files? BAM! The ankle monitor goes off and the authorities are alerted.\
Everything is shut down before any real damage is done!

### ➢  And where to get it?

Here is the kicker. You went with **Debian**, right? Smart move just as I told ya.\
AppArmor comes pre-installed on Debian. Everything is already there.\
It's like the court house is giving you a free pass just for showing up. (Trust me, this never happens...)

But... (I like big buts and I cannot lie) don't get lazy now!\
Just because it is in the building, it doesn't mean it's armed, you know. Do your due diligence.\
A sharp evaluator won't just ask you if you have it but they'll want to see that you know it's active and that the correct profiles are loaded in `enforce` mode.\
So you better check that with `sudo aa-status`. That's the difference between a chump who owns a safe and the guy who owns the building.

## 👨‍⚖️ By order of the Judge  - Strong password policy

Every lock needs a strong key. And no, your birthday or "password" won't do the trick. Not this time.

### ➢  The policy

The B2BR subject requires you to enforce a password policy so strict that even the FBI would say "Chill."

- 🔐 Passwords must be **at least 10 characters**
- 🔡 Must contain at least 1 **uppercase**, 1 **lowercase** and 1 **digit**
- ✋ No more than **3 consecutive identical characters**
- ♻️ Must have at least 7 characters that are not part of the former password
- 🚫 You can't include the username
- ✔ All rules apply even to almighty `root`

### ➢  But how can I enforce this policy Saul?

Glad you asked! First things first: You'll need to install a favourite of mine: `libpam-pwquality` (remember to use apt as we discussed)\
That's your system's personal trainer for passwords. You want weak passwords? Call whoever, even Huell if you'd like. You want secure ones? You better call PAM.

Once that's done, access `/etc/pam.d/common-password` with your favourite editor and change the `password requisite` line. Easy!

```shell
password requisite pam_pwquality.so minlen=10 dcredit=-1 ucredit=-1 lcredit=-1 maxrepeat=3 difok=7 reject_username enforce_for_root
```

<table align="center">
  <tr>
    <th align="center">🔐</th>
    <th align="center">minlen=10</th>
    <td align="center">Minimum length</td>
  </tr>
    <tr>
    <th align="center">🔡</th>
    <th align="center">dcredit=-1 ucredit=-1 lcredit=-1</th>
    <td align="center">Minimum number of Digits, Uppercase and Lowercase (-1 = requires at least one)</td>
  </tr>
    <tr>
    <th align="center">✋</th>
    <th align="center">maxrepeat=3</th>
    <td align="center">Maximum repetition of the same character</td>
  </tr>
      <tr>
    <th align="center">♻️</th>
    <th align="center">difok=7</th>
    <td align="center">Number of characters in the new password that must not be present in the old one</td>
  </tr>
        <tr>
    <th align="center">🚫</th>
    <th align="center">reject_username</th>
    <td align="center">Can't contain the username</td>
  </tr>
          <tr>
    <th align="center">✔</th>
    <th align="center">enforce_for_root</th>
    <td align="center">Apply the rules for root</td>
  </tr>
</table>

Now just change the password of your user and root with the command `passwd`.

> [!TIP]
> The subject says that the 4th rule (7 characters that are not part of the former password) doesn't apply to root.\
> This is already the case by default because changing the root password doesn't require the old password.
>
> Also, be very careful: Don't add a space before the values (for example ucredit= -1). This won't work.


### ➢  Expiration

Your password must also respect the expiration rules from the B2BR subject:

- Expires every **30 days**
- Can't change for **2 days** after it has been set
- Users receive a warning **7 days** before it expires

Here you're gonna tango with `/etc/login.defs`. You'll just have to modify the corresponding lines:

```shell
PASS_MAX_DAYS 30
PASS_MIN_DAYS 2
PASS_WARN_AGE 7
```

Test the expiration with `chage -l user` to see if the settings stick.\
They don't? Well that's normal for old users. You'll need to apply it manually:

```shell
chage -M 30 user
chage -m 2 user
```

And don't forget to do the same with root!\
Perfect. You're all set and you already have better security than half of Albuquerque.

## 🖥️ The server's snitch  - Monitoring.sh

Every 10 minutes, the B2BR subject requires your server to shout its vital signs.\
The `Monitoring.sh` script will be your trusted friend. A snitch that works only for you!

### ➢  A script? Saul, I'm not a Hollywood screenwriter!

Relax. We're not talking Scorsese here.\
A shell script is just a list of commands executed one after another.\
What kind of dirt does this informant dig up? The juicy stuff.

<table align="center">
  <tr>
    <td align="center"><code>#Architecture:</code></td>
    <th align="center">The OS architecture and its kernel version</th>
    <td align="center"><code>uname -a</code> will spill the beans</td>
  </tr>
  <tr>
     <td align="center"><code>#CPU physical:</code></td>
    <th align="center">The number of physical processors</th>
    <td align="center">A friend of mine can help, you'll reach him at <code>lscpu</code> and ask him where the Sockets are</td>
  </tr>
  <tr>
     <td align="center"><code>#vCPU:</code></td>
    <th align="center">The number of virtual processors</th>
    <td align="center">Seek the help of <code>nproc</code>. That's one of my colleagues</td>
  </tr>
  <tr>
     <td align="center"><code>#Memory Usage:</code></td>
    <th align="center">RAM usage and percentage of its utilization rate</th>
    <td align="center">Is your server gasping for memory like a fish out of water?</br><code>free -m</code> is the way to go!</td>
  </tr>
  <tr>
    <td align="center"><code>#Disk Usage:</code></td>
    <th align="center">Available storage on the server and percentage of its utilization rate</th>
    <td align="center">How full are your partitions? <code>df -h</code> will show you the lay of your land</td>
  </tr>
  <tr>
     <td align="center"><code>#CPU load:</code></td>
    <th align="center">CPU usage as a percentage</th>
    <td align="center">Have you met <code>mpstat</code>? You will have to install the <b>sysstat</b> package</td>
  </tr>
  <tr>
     <td align="center"><code>#Last boot:</code></td>
    <th align="center">Date and time of the last reboot</th>
    <td align="center"><code>who -b</code> or <code>uptime</code> can tell you. I prefer the first, but don't tell</td>
  </tr>
  <tr>
    <td align="center"><code>#LVM use:</code></td>
    <th align="center">LVM usage (yes or no)</th>
    <td align="center">A classic trick thanks to <code>lsblk</code> will do</td>
  </tr>
  <tr>
    <td align="center"><code>#Connections TCP:</code></td>
    <th align="center">Number of established TCP connections </td>
    <td align="center">Who's talking to your server and on what ports?</br>My guy <code>ss</code> hears everything. It displays Socket Statistics and trust me, it's got options.</td>
  </tr>
  <tr>
    <td align="center"><code>#User log:</code></td>
    <th align="center">Number of logged in users </th>
    <td align="center"><code>who</code> is currently logged into the machine?</td>
  </tr>
  <tr>
    <td align="center"><code>#Network:</code></td>
    <th align="center">IPV4 and MAC addresses </th>
    <td align="center"><code>ip address</code> has got so much information. Just know that <b>enp0s3</b> is your server's main phone line, <b>inet</b> its public street address and <b>ether</b> its unchangeable hardware fingerprint.</td>
  </tr>
  <tr>
    <td align="center"><code>#Sudo:</code></td>
    <th align="center">Number of <code>sudo</code> commands used </th>
    <td align="center">Pro tip: a file is created at <code>/var/log/sudo/</code> containing the number of sudo commands made in base 36. Time to do some <code>b</code>asic <code>c</code>alculations, right?</td>
  </tr>
</table>

<ins>Example of output:</ins>

```shell
Broadcast message from root@goodman42 (tty1) (Sun Jun 8 22:40:00 2025):
#Architecture: Linux sgoodman42 6.1.0-37-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.140-1 (2025-05-22) x86_64 GNU/Linux
#CPU physical: 1
#vCPU: 2
#Memory Usage: 718/7941MB (9.04%)
#Disk Usage: 3/35Gb (7%)
#CPU load: 6.31%
#Last boot: 2025-06-08 21:32
#LVM use: yes
#Connections TCP: 1 ESTABLISHED
#User log: 1
#Network: IP 10.0.2.15 (08:00:27:51:9b:a5)
#Sudo: 42 cmd
```

And it better sends it to all terminals *every 10 minutes* AND at boot.

### ➢  Cron, your automated taskmaster

Now, are you really gonna log in every 10 minutes and run this script manually?\
Come on, you've got better things to do like for example... well..Whatever it is you actually do.

We need automation! We need CRON.

`cron` is a daemon (basically one of the background worker bees) that runs commands on a schedule that YOU define.\
Think of it as your own personal "scheduler". A little gnome in the machine that runs tasks for you at specific times.\
Every hour, every day, once a week on Monday... you name it.

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/lPujm0n.png" alt="UFW" width="300">
    </td>
  </tr>
  <tr>
    <td align="center">
        No questions asked, no backtalk. It's the perfect employee.
    </td>
  </tr>
</table>

To give it instructions, you edit a special file called a `crontab` and you tell it:
> Hey cron, see this `monitoring.sh` script? I want you to run it every 10 minutes. And I want you to shout the output to all the logged in users. Very cool, thank you.

And this is how you actually do it:
- First, access it by typing `crontab -e` (e is for edit)
- Add this line
```shell
*/10 * * * * /path_to_your/monitoring.sh | wall
```

Now the syntax can look a little like some ancient hieroglyphic shenanigans but trust me, you'll get it.

<table align="center">
  <tr>
    <th align="center"><code>*/10</code></th>
    <td align="center">Every 10 minutes</td>
  </tr>
  <tr>
    <th align="center"><code>* * * *</code></th>
    <td align="center">of every hour, of every day of the month, of every month, of every day of the week</td>
  </tr>
  <tr>
    <th align="center"><code>/path/to/your/monitoring.sh</code></th>
    <td align="center">Do yourself a favor and toss your script into <code>/usr/local/bin</code> because that's where respectable non system breaking scripts live</td>
  </tr>
  <tr>
    <th align="center"><code>| wall</code></th>
    <td align="center">Pipe the output of the script to the <code>wall</code> command (<b>W</b>rite to <b>ALL</b>) to display on the terminals of all logged in users</td>
  </tr>
</table>

> [!TIP]
> By the way...
> Don't forget to `chmod +x monitoring.sh` or you’llook silly during evaluation...

## 💸 The High roller's suite  - WordPress & friends

Feeling lucky? Wanna go all the way in?\
Fine, we'll be building a full-blown web presence then.

### ➢  What's the big idea?

The bonus part is all about setting up a dynamic website thanks to **WordPress**. But WordPress is one nasty diva.\
It doesn't work alone and it needs a whole entourage of services with it.

- **A web server** (`Lighttpd`)\
This is the guy who stands at the door of your website and greets inco visitors. It takes their requests and shows them the page.\
B2BR requires Lighttpd which is a good choice: fast and doesn't hog the resources.

- **A Database** (`MariaDB`)\
WordPress has a lot of... mmm... stuff, yes. Posts, comments, info on users... It needs somewhere to store all of that.\
MariaDB is reliable and organized. Think of it as your digital filing cabinet.

- **PHP**\
The translator. The web server speaks one language and WordPress another.\
PHP sits there in the middle and makes sure everyone understands each other.

- **A service of your choice**\
Choose a service of your choice that would be useful (B2BR excludes NGINX / Apache2).\
Fail2ban is a really good choice but feel free to explore and test others.

After that, you are free to customize your website or not. The subject doesn't require it.

<table align="center">
  <tr>
    <td align="center">
      <img src="https://i.imgur.com/raKsGqd.png" alt="Saul's website" width="500">
    </td>
  </tr>
  <tr>
    <td align="center">
        To access the website you'll need to forward the port 80 elsewhere too.</br>Otherwise your browser has no way to reach the website running inside the virtual machine
    </td>
  </tr>
</table>


---

## Final Word

> So there you have it. It's a lot to take in, I know.\
> But follow the Goodman plan and you will be golden, my friend.\
> Now go on, get to it. And remember who to call.

<p align="center">
  <img src="https://i.imgur.com/l7uDamP.gif" width="500" alt="It's all good, man.">
</p>

<hr>
<p align="center">
<sub><i>BORN2BEROOT badge © @Cadets for Cadets — used under MIT License.</i></sub>
<br>
<sub><a href="https://github.com/ayogun/42-project-badges/blob/main/LICENSE">See full license here</a></sub>
</p>

