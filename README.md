# Serf-Rancher

[![Build Status](https://travis-ci.org/marceloalmeida/serf-rancher.svg?branch=master)](https://travis-ci.org/marceloalmeida/serf-rancher)

This is simple Docker image that create a Serf cluster on Rancher, with own metadata details. Also have `user-exec` handler that allows user to run any shell command on entire cluster and receive/log all node responses on a log.

## Serf

Serf is a decentralized solution for service discovery and orchestration that is lightweight, highly available, and fault tolerant.

## Rancher

Rancher is an open source project that provides a complete platform for operating Docker in production. It provides infrastructure services such as multi-host networking, global and local load balancing, and volume snapshots. It integrates native Docker management capabilities such as Docker Machine and Docker Swarm. It offers a rich user experience that enables devops admins to operate Docker in production at large scale.
