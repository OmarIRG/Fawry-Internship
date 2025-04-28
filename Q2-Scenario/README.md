# Troubleshooting DNS and Service Connectivity

## Introduction

This document outlines the steps taken to troubleshoot DNS and service connectivity issues on a Linux system. The goal is to resolve the issue where the internal web dashboard hosted at `internal.example.com` is unreachable due to DNS resolution problems or misconfigured services.

## Steps to Troubleshoot the Issue

### 1. Verify DNS Resolution

To check if the DNS is resolving properly, we can use the `dig` command to resolve the domain `internal.example.com`.

#### Command:
```bash
dig internal.example.com
```

#### Expected Output:
The output should show the DNS resolution result, such as an IP address. If you receive a `NXDOMAIN` status, it indicates that the domain does not exist in the current DNS.

Example Output:
```
; <<>> DiG 9.18.30-0ubuntu0.22.04.2-Ubuntu <<>> internal.example.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 33386
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1
```

If DNS resolution fails, we can compare it with Google's DNS (8.8.8.8) by using:
```bash
dig @8.8.8.8 internal.example.com
```

### 2. Verify Service Reachability

To check if the service (web service) is running on the server, use the `ss` command to check the ports 80 (HTTP) and 443 (HTTPS).

#### Command:
```bash
sudo ss -tuln | grep -E '(:80|:443)'
```

If there is no output, the service may not be running.

You can also check running services using:

```bash
ps aux | grep apache2
ps aux | grep nginx
```

Or monitor real-time processes with:

```bash
top
```

Check the service status using `systemctl`:

```bash
sudo systemctl status apache2
sudo systemctl status nginx
```

If the service is not running, start it with:

```bash
sudo systemctl start apache2
sudo systemctl start nginx
```

### 3. Check DNS Settings Using `resolvectl`

Inspect the current DNS settings:

```bash
resolvectl status
```

Example output shows the DNS server(s) in use. If your internal domain is not resolvable, this might indicate misconfiguration.

### 4. Modify `/etc/hosts` for Testing

If DNS resolution fails, you can manually map the domain to an IP address.

Edit the hosts file:

```bash
sudo nano /etc/hosts
```

Add the line:

```
192.168.x.x internal.example.com
```

Replace `192.168.x.x` with the actual server IP.

Save and exit the editor, then test the connection again:

```bash
curl http://internal.example.com
```

### 5. Checking Firewall and Network Settings

Check if the firewall is blocking traffic:

```bash
sudo ufw status
```

If needed, allow HTTP and HTTPS ports:

```bash
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

### 6. Testing and Verification

After applying the fixes:

- Verify DNS again:
```bash
dig internal.example.com
```
- Verify service accessibility:
```bash
curl http://internal.example.com
ping internal.example.com
```

### Screenshots to Capture

- Output of `dig internal.example.com`
- Output of `ss -tuln | grep -E '(:80|:443)'`
- Editing `/etc/hosts`
- Checking service status with `systemctl`

## Conclusion

Following this guide helps identify whether the issue lies in DNS resolution, web service availability, or network configuration, ensuring that `internal.example.com` becomes accessible again.

