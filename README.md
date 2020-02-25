[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield2]][linkedin-url2]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Hireable][hireable]][hireable-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
 <h2 align="center">Private Events Application.</h2>

  <p align="center">
    Ruby on Rails project that implements a clone of Event Brite
    <br />
    <a href="https://github.com/YairFernando67/private_events"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/YairFernando67/private_events">View demo</a>
    ·
    <a href="https://github.com/YairFernando67/private_events/issues">Report bug</a>
    ·
    <a href="https://github.com/YairFernando67/private_events/issues">Request feature</a>
  </p>

</p>

## Table of Contents
* [About the project](#about-the-project)
  * [Built with](#built-with)
* [Required installations](#Required-Installations)
  * [Prerequisites](#Prerequisites)
  * [Installing](#Installing)
  * [Instructions](#Instructions)
* [Contact](#contact)
* [Contributing](#Contributing)
* [Show your support](#Show-your-support)

## About The Project

![Screenshot Image](app/assets/images/login.png) 
![Screenshot Image](app/assets/images/logout.png) 
![Screenshot Image](app/assets/images/invites.png) 
![Screenshot Image](app/assets/images/events.png) 

### Built With
The project was developed using the following technologies:
- [Ruby](https://www.ruby-lang.org/es/)
- [Ruby on Rails](https://rubyonrails.org/)

## Required Installations

### Prerequisites

This project runs on [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Ruby on Rails](http://installrails.com/)

### Installing

<p>Install the following to get this project running in your machine:</p>
 
* Ruby
* Ruby on Rails

After installation run `ruby -v` to make sure Ruby installed correctly. Example:
```
$ ruby -v
ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-linux]
```

Also make sure that Rails is installed, but running `rails -v`. 
Example:
```
$ rails -v
Rails 6.0.2.1
```

### Instructions

<p>Follow these steps:</p>

Clone the Repository

```Shell
user@pc:~$ git clone https://github.com/YairFernando67/private_events
```

On the console go to the folder that was created

```Shell
user@pc:~$ cd private_events
```

```
user@pc:~/private_events$ bundle install --without production
```

Then migrate the database:

```
user@pc:~/private_events$ rails db:migrate
```

Run this command if you encountered a problem running rails db:migrate

```
user@pc:~/private_events$ bundle exec rails db:migrate
```

To run the rspec tests run

```
user@pc:~/private_events$ rspec spec
```


Finally run the server

```
user@pc:~/private_events$ rails s
```

Open your browser on [http://localhost:3000](http://localhost:3000)

## Contact

👤 **Yair Fernando Facio**

<a href="https://yairfernando67.github.io/Portfolio/" target="_blank">
    
  ![Screenshot Image](app/assets/images/yair-profile.png) 

</a>

- Github: [@YairFernando67](https://github.com/YairFernando67)
- Twitter: [@YairFernando18](https://twitter.com/YairFernando18)
- Linkedin: [softwaredeveloperyairfacio](https://www.linkedin.com/in/softwaredeveloperyairfacio/)
- Email: [yair.facio11@gmail.com](https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=yair.facio11@gmail.com)
- Portfolio: [softwaredeveloper](https://yairfernando67.github.io/Portfolio/)

👤 **Jaak Kivinukk**

<a href="https://github.com/Jaakal" target="_blank">
    
  ![Screenshot Image](app/assets/images/jaak-profile.png) 

</a>

- Github: [@Jaakal](https://github.com/Jaakal)
- Twitter: [@JKivinukk](https://twitter.com/JKivinukk)
- Linkedin: [full-stack-developer](https://www.linkedin.com/in/jaak-kivinukk-7098b1153/)
- Email: [jaak.kivinukk@gmail.com](jaak.kivinukk@gmail.com)

<p align="center">

  Project Link: [https://github.com/YairFernando67/private_events](https://github.com/YairFernando67/private_events)

</p>

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/YairFernando67/private_events/issues).

## Show your support

Give a ⭐️ if you like this project!

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/YairFernando67/private_events.svg?style=flat-square
[contributors-url]: https://github.com/YairFernando67/private_events/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/YairFernando67/private_events.svg?style=flat-square
[forks-url]: https://github.com/YairFernando67/private_events/network/members
[stars-shield]: https://img.shields.io/github/stars/YairFernando67/private_events.svg?style=flat-square
[stars-url]: https://github.com/YairFernando67/private_events/stargazers
[issues-shield]: https://img.shields.io/github/issues/YairFernando67/private_events.svg?style=flat-square
[issues-url]: https://github.com/YairFernando67/private_events/issues
[license-shield]: https://img.shields.io/github/license/YairFernando67/private_events.svg?style=flat-square
[license-url]: https://github.com/YairFernando67/private_events/blob/master/LICENSE.txt
[linkedin-shield2]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url2]: https://www.linkedin.com/in/softwaredeveloperyairfacio/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/jaak-kivinukk-7098b1153/
[hireable]: https://cdn.rawgit.com/hiendv/hireable/master/styles/flat/yes.svg
[hireable-url]: https://www.linkedin.com/in/softwaredeveloperyairfacio/