# 🛠️ Troubleshooting DNS and Service Connectivity for `internal.example.com`

---

## 1. Verify DNS Resolution

### Step 1A: Check the default DNS server
```bash
cat /etc/resolv.conf
```
📸 **Screenshot:**  
![Know DNS Server](./1%20Know%20DNS%20Server.png)

### Step 1B: Test DNS resolution with default DNS
```bash
dig internal.example.com
```
📸 **Screenshot:**  
![Check The IP Of The DNS Name](./2%20Check%20The%20Ip%20Of%20The%20DNS%20Name.png)

### Step 1C: Test resolution with Google's 8.8.8.8
```bash
dig @8.8.8.8 internal.example.com
```
📸 **Screenshot:**  
![Checking 8.8.8.8 DNS Server For The IP](./3%20Checking%208.8.8.8%20DNS%20Server%20For%20The%20IP.png)

## 2. Diagnose Service Reachability

### Step 2A: Test with `curl`
```bash
curl -v http://internal.example.com
```
📸 **Screenshot:**  
![Testing Curl Command](./4%20Testing%20Curl%20Command.png)

## 3. Bypass DNS Temporarily

### Step 3A: Add manual IP mapping
```bash
sudo nano /etc/hosts
```
Add:
```
192.168.x.x internal.example.com
```
📸 **Screenshot:**  
![Bypassing the DNS By Adding The IP Manually](./5%20bypassing%20the%20DNS%20By%20Adding%20The%20Ip%20Manually.png)

### Step 3B: Test After Manual IP Addition
```bash
ping internal.example.com
curl http://internal.example.com
```
📸 **Screenshot:**  
![After Adding The IP Manually](./6%20After%20Adding%20The%20Ip%20Manually.png)

## 4. Verify DNS Settings with `resolvectl`

```bash
resolvectl status
```
📸 **Screenshot:**  
![DNS Status](./7%20DNS%20Status.png)

---

# ✅ Conclusion

By following this method, we identify if the issue lies within DNS configuration, the web server, or the network, ensuring successful access to `internal.example.com`.


