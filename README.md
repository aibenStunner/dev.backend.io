# GodsEye Backend 👀

![Date](https://img.shields.io/static/v1?label=date&message=30/06/2020&color=green&style=for-the-badge)

This repository contains:

1.  the source code of the server which powers the Godseye platform.
    <a href="https://gitlab.com/dev.io/dev.backend.io/-/tree/developers">(developers branch)</a>

2.  the hardware code which runs on the Raspberry PI used as a camera hub.
    <a href="https://gitlab.com/dev.io/dev.backend.io/-/tree/hardwareDev">(hardwareDev branch)</a>
        

## Server Information

![version](https://img.shields.io/static/v1?label=version&message=1.0.20&color=important&style=for-the-badge) ![status](https://img.shields.io/static/v1?label=status&message=production&color=blue&style=for-the-badge)

Find it live at: [Godseye Backend](http://godseye-env.eba-gpcz6ppk.us-east-2.elasticbeanstalk.com/)

### API Documentation :books:

![](https://img.shields.io/static/v1?label=&message=POSTMAN&color=ffab59&style=for-the-badge&logo=Postman)

The REST API reference, guidelines for developers, FAQs and sample code for effectively consuming this API are available [here](https://documenter.getpostman.com/view/11664536/SzzdCLYo?version=latest).

### Technical Details ⚙️

![backend](https://img.shields.io/static/v1?label=&message=Node.JS&color=success&style=for-the-badge&logo=Node.js) ![database](https://img.shields.io/static/v1?label=&message=MySQL&color=77acd5&style=for-the-badge&logo=mysql)

This backend was built with Express on NodeJS with security and performance in mind.

Its functions are mainly authentication, session management, and live feed streaming.

The database engine used for the backend is MySQL. All fields necessary for lookup have been indexed.

Password salting and hashing was done with bcrypt.

### Production 🎛️

![platform](https://img.shields.io/static/v1?label=&message=Elastic%20Beanstalk&color=ff9900&style=for-the-badge&logo=Amazon-AWS) ![database](https://img.shields.io/static/v1?label=&message=Amazon%20RDS&color=232f3e&style=for-the-badge&logo=Amazon-AWS)

In production, the server is deployed on Elastic Beanstalk (AWS) running on Node.js 12
on 64bit Amazon Linux 2/5.1.0 on a single EC2 instance.

The database and server computing units are within the same geographical area (USA East 2)
and this leads to fast query results.

On average the server reports a CPU utilization of 0.6% with a peak value of 4.6% so far.

The database reports an average CPU utilization of 3% .

## Hardware Information

![board](https://img.shields.io/static/v1?label=&message=Raspberry%20PI&color=c51a4a&style=for-the-badge&logo=Raspberry-PI)

A Raspberry PI 4 computer with two web cameras was used as a media server for the hardware development of this project.

Live camera feeds are tunneled from the PI Computer with ngrok.

Ngrok cloud service accepts traffic on a public address and relays that traffic through to the ngrok process running on the PI and then on to the local address specified for a requested camera's feed.

### Documentation :books:

Guidelines to how this setup can be done are available <a href="https://gitlab.com/dev.io/dev.backend.io/-/blob/hardwareDev/docs.pdf">here</a>.

### Technical Details ⚙️

![python](https://img.shields.io/static/v1?label=&message=Python&color=ffcc00&style=for-the-badge&logo=Python) ![bash](https://img.shields.io/static/v1?label=&message=Bash&color=000&style=for-the-badge&logo=gnu-bash)

This hardware setup makes use of <a href="https://motion-project.github.io/">Motion</a>, an open source highly configurable program that monitors video signals from many types of cameras, to access the camera feeds.

The camera feeds are made accessible over the internet using <a href="https://ngrok.com/">ngrok</a>, a secure introspectable tunnels to localhost webhook development and debugging tool.

Other scripts (Python, BASH) were written to enable the setup function as a single unit.

## Demo :movie_camera:
Demo video can be found [here](https://youtu.be/0mx5jkTiKyU)

[dev.io]()


