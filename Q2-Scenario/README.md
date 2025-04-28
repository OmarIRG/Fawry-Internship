# 🛠️ Troubleshooting DNS and Service Connectivity for `internal.example.com`

When your internal web dashboard at `internal.example.com` becomes unreachable, it's important to diagnose and fix the issue carefully. Below are the detailed steps we take, with explanations of why each step is necessary, so you can understand and solve the problem systematically.

---

## 1. Verify DNS Resolution

### 1.1 Check the DNS Servers in Use

```bash
cat /etc/resolv.conf
```
📸 **Screenshot:**
![Know DNS Server](./1%20Know%20DNS%20Server.png)

**Why?**  
This command shows which DNS servers your system is using. If these servers are not reachable or incorrectly configured, domain resolution will fail.

---

### 1.2 Test DNS Resolution with Current DNS

```bash
dig internal.example.com
```
📸 **Screenshot:**
![Check The IP Of The DNS Name](./2%20Check%20The%20Ip%20Of%20The%20DNS%20Name.png)

**Why?**  
To check if your DNS server is able to resolve the domain correctly. If it fails, it points to a local DNS problem.

---

### 1.3 Test DNS Resolution Using Google's Public DNS

```bash
dig @8.8.8.8 internal.example.com
```
📸 **Screenshot:**
![Checking 8.8.8.8 DNS Server For The IP](./3%20Checking%208.8.8.8%20DNS%20Server%20For%20The%20IP.png)

**Why?**  
Testing with Google’s DNS helps determine if the problem is local. If Google resolves it but your internal server does not, then the issue is your local DNS.

---

## 2. Test Service Reachability

### 2.1 Use `curl` to Test HTTP Service Response

```bash
curl -v http://internal.example.com
```
📸 **Screenshot:**
![Testing Curl Command](./4%20Testing%20Curl%20Command.png)

**Why?**  
This verifies if the HTTP server is responding. A failed or delayed response suggests server-side or network issues.

---

## 3. Temporarily Bypass DNS

### 3.1 Manually Add a Host Entry

```bash
sudo nano /etc/hosts
```
Add:

```
192.168.x.x internal.example.com
```
📸 **Screenshot:**
![Bypassing the DNS By Adding The IP Manually](./5%20bypassing%20the%20DNS%20By%20Adding%20The%20Ip%20Manually.png)

**Why?**  
This forces the system to map the domain to an IP manually, bypassing any DNS problems temporarily for testing.

---

### 3.2 Test After Manual Entry

```bash
ping internal.example.com
curl http://internal.example.com
```
📸 **Screenshot:**
![After Adding The IP Manually](./6%20After%20Adding%20The%20Ip%20Manually.png)

**Why?**  
To ensure the manual entry works and the service is reachable.

---

## 4. Check DNS Status via `resolvectl`

```bash
resolvectl status
```
📸 **Screenshot:**
![DNS Status](./7%20DNS%20Status.png)

**Why?**  
To review the active DNS configuration and troubleshoot if any incorrect settings are affecting resolution.

---

## 5. Check the Web Server Status

Sometimes the web service itself is down even though DNS works fine. Here's how to check:

### 5.1 Check if the Web Server Process is Running

```bash
ps aux | grep -E 'apache2|nginx'
```

**Why?**  
This helps you verify whether the web server process (Apache or Nginx) is active.

---

### 5.2 Check Web Service Status with systemctl

```bash
sudo systemctl status apache2
sudo systemctl status nginx
```

**Why?**  
To check if the service is running, inactive, or failed.

---

### 5.3 Start the Web Server If It Is Down

```bash
sudo systemctl start apache2
sudo systemctl start nginx
```

**Why?**  
If the service is stopped, starting it should make your web dashboard accessible again.

---

## ✅ Conclusion

Following these steps will help you identify whether the issue lies in DNS resolution, the web service status, or the network configuration. Always start from verifying DNS, testing reachability, and finally checking the actual service status. This approach ensures you quickly diagnose and restore access to `internal.example.com`.

---


