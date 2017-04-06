#!/bin/bash
mv steam/steamcmd.exe ./
mv steam/download.me ./
rm -rvf steam/*
rm -rvf gmodds
mv steamcmd.exe steam/
mv download.me steam/
