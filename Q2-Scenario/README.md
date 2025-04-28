# 🛠️ Troubleshooting DNS and Service Connectivity for `internal.example.com`

---

## 1. Verify DNS Resolution

### 1.1 Check Which DNS Servers Are Being Used

```bash
cat /etc/resolv.conf
```
📸 **Screenshot:**  
![Know DNS Server](./1%20Know%20DNS%20Server.png)

**Why did I do this?**  
I needed to see which DNS servers my system was relying on. If the servers were unreachable or misconfigured, domain resolution would definitely fail.

---

### 1.2 Test DNS Resolution Using the Current DNS Server

```bash
dig internal.example.com
```
📸 **Screenshot:**  
![Check The IP Of The DNS Name](./2%20Check%20The%20Ip%20Of%20The%20DNS%20Name.png)

**Why did I do this?**  
I wanted to check whether my current DNS server could resolve the domain. If this failed, it would indicate a local DNS problem.

---

### 1.3 Test DNS Resolution Using Google’s Public DNS

```bash
dig @8.8.8.8 internal.example.com
```
📸 **Screenshot:**  
![Checking 8.8.8.8 DNS Server For The IP](./3%20Checking%208.8.8.8%20DNS%20Server%20For%20The%20IP.png)

**Why did I do this?**  
Testing with Google’s DNS helped me determine if the problem was with my internal DNS server. If Google resolved it but my internal server didn’t, then the issue was definitely local.

---

## 2. Test Service Reachability

### 2.1 Use `curl` to Test HTTP Service Response

```bash
curl -v http://internal.example.com
```
📸 **Screenshot:**  
![Testing Curl Command](./4%20Testing%20Curl%20Command.png)

**Why did I do this?**  
I needed to verify whether the HTTP server was responding correctly. A failure or timeout would suggest server or network issues.

---

## 3. Temporarily Bypass DNS

### 3.1 Manually Add an Entry to `/etc/hosts`

```bash
sudo vim /etc/hosts
```
I added the following line:

```
192.168.x.x internal.example.com
```
📸 **Screenshot:**  
![Bypassing the DNS By Adding The IP Manually](./5%20bypassing%20the%20DNS%20By%20Adding%20The%20Ip%20Manually.png)

**Why did I do this?**  
I wanted to bypass DNS resolution temporarily and manually link the domain to its IP address to continue testing.

---

### 3.2 Test After Manual `/etc/hosts` Entry

```bash
ping internal.example.com
curl http://internal.example.com
```
📸 **Screenshot:**  
![After Adding The IP Manually](./6%20After%20Adding%20The%20Ip%20Manually.png)

**Why did I do this?**  
I needed to make sure the manual entry worked and the service was now reachable without relying on DNS.

---

## 4. Check DNS Status Using `resolvectl`

```bash
resolvectl status
```
📸 **Screenshot:**  
![DNS Status](./7%20DNS%20Status.png)

**Why did I do this?**  
I wanted to review the system’s active DNS configuration and ensure there weren’t any incorrect or unexpected settings causing resolution issues.

---

## 5. Check Web Server Status

Sometimes, even if DNS is working, the web service itself could be down.

### 5.1 Verify if the Web Server Process Is Running

```bash
ps aux | grep -E 'apache2|nginx'
```

**Why did I do this?**  
I needed to check whether the Apache or Nginx process was running properly.

---

### 5.2 Check Web Server Status Using systemctl

```bash
sudo systemctl status apache2
sudo systemctl status nginx
```

**Why did I do this?**  
I needed to confirm whether the web server was active, inactive, or had failed for some reason.

---

### 5.3 Start the Web Server If It's Down

```bash
sudo systemctl start apache2
sudo systemctl start nginx
```

**Why did I do this?**  
If the web server had stopped, starting it should bring the internal dashboard back online.

---

## ✅ Conclusion

By following these steps, I was able to systematically figure out whether the problem was related to DNS resolution, the web server itself, or the network configuration.  
Starting with DNS checks, then service reachability tests, and finally verifying server status ensured that I could diagnose and solve the problem quickly and efficiently, restoring access to `internal.example.com`.

---

