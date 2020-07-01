# GodsEye Backend

![version](https://img.shields.io/static/v1?label=version&message=1.0.19&color=important&style=for-the-badge) ![status](https://img.shields.io/static/v1?label=status&message=production&color=blue&style=for-the-badge) ![backend](https://img.shields.io/static/v1?label=&message=Node.JS&color=success&style=for-the-badge&logo=Node.js) ![database](https://img.shields.io/static/v1?label=&message=MySQL&color=turquoise&style=for-the-badge&logo=mysql)

Find it live at: [Godseye Backend](http://godseye-env.eba-gpcz6ppk.us-east-2.elasticbeanstalk.com/)

This repository contains:

    1.  the source code of the server which powers the Godseye platform.
        (developers branch)

    2.  the hardware code which runs on the Raspberry PI used as a camera hub
        (hardwareDev branch)

## API Documentation

The REST API reference, guidelines for developers, FAQs and sample code for effectively
consuming this API are available [here](https://documenter.getpostman.com/view/11664536/SzzdCLYo?version=latest).

## Technical Details

This backend was built with Express on NodeJS with security and performance in mind.

Its functions are mainly authentication, session management, and live feed streaming.

The database engine used for the backend is MySQL. All fields necessary for lookup
have been indexed.

Password salting and hashing was done with bcrypt.

## Hardware Development

A Raspberry PI 4 computer with two web cameras was used as a media server for the hardware development of this project.

Live camera feeds are tunneled from the PI Computer with ngrok.

Ngrok cloud service accepts traffic on a public address and relays that traffic through to the ngrok process running on the PI and then on to the local address specified for a requested camera's feed.

Information on how this can be setup can be found [here](https://gitlab.com/dev.io/dev.backend.io/-/blob/hardwareDev/docs.pdf).

## Production

In production, the server is deployed on Elastic Beanstalk (AWS) running on Node.js 12
on 64bit Amazon Linux 2/5.1.0 on a single EC2 instance.

The database and server computing units are within the same geographical area (USA East 2)
and this leads to fast query results.

On average the server reports a CPU utilization of 0.6% with a peak value of 4.6% so far.

The database reports an average CPU utilization of 3% .
