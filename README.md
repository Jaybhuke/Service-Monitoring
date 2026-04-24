# Service Monitor & Auto-Recovery system

## Overview

This project is a Bash based automation script that monitors the status of a system service (e.g., nginx). If the service goes down, the script automatically restarts it, logs the activity, and sends real-time alerts using the Telegram API.

---

## Features
- Services status monitoring using `systemctl`
- Automatic restart on failure
- Logging of service health and actions
- Telegram alert integration
- Cron ready automation

---

## TEchnologies used

- Linux
- Bash Scripting
- systemctl
- Cron (optional)
- Telegram Bot API

---

## How it works
1. Checks service status using `systemctl is-active`
2. If service is not active:
    - Logs failure event
    - Attempts to restart service
    - Sends alert via Telegram
3. If service is active:
    - Logs healthy status

## Setup Instructions

### 1. Make Script Exceutable

```bash
chmod +x service_monitor.sh
```


