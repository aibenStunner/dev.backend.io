# GodsEye Backend

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

## Production

In production, the server is deployed on Elastic Beanstalk (AWS) running on Node.js 12 
on 64bit Amazon Linux 2/5.1.0 on a single EC2 instance.

The database and server computing units are within the same geographical area (USA East 2)
and this leads to fast query results.

On average the server reports a CPU utilization of 0.6% with a peak value of 4.6% so far.

The database reports an average CPU utilization of 3% .
