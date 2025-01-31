# NMAP


## varre todos os dispositivos que estao conectados no seu roteador:
nmap -sn 192.168.0.1/24
sudo nmap -sn 192.168.0.1/24

Resultado:
```
	Starting Nmap 7.93 ( https://nmap.org ) at 2025-01-31 13:12 -03
	Nmap scan report for 192.168.0.1
	Host is up (0.0060s latency).
	Nmap scan report for 192.168.0.11
	Host is up (0.0031s latency).
	Nmap scan report for 192.168.0.18
	Host is up (0.000043s latency).
	Nmap done: 256 IP addresses (3 hosts up) scanned in 2.39 seconds


```

## informações de um dispositivo específico da lista acima:
sudo nmap -A -T4 192.168.0.11



Fontes:
https://pt.linux-console.net/?p=8213
https://maisgeek.com/como-ver-todos-os-dispositivos-em-sua-rede-com-nmap-no-linux/

