#!/bin/bash

systemctl daemon-reload
systemctl start pritunl
systemctl enable pritunl
