{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # Shell
      girsh # Automatically spawn a reverse shell fully interactive for Linux or Windows victim
      rlwrap # Readline wrapper: adds readline support to tools that lack it
      rustcat # Netcat alternative written in Rust

      # OSINT
      maigret # Collect a dossier on a person by username from thousands of sites
      sherlock # Find usernames across social networks

      # Servers
      updog # Updog is a replacement for Python's SimpleHTTPServer. It allows uploading and downloading via HTTP/S, can set ad hoc SSL certificates and use http basic auth

      # Cracking
      legba # A tool for cracking credentials using brute force
      stegseek # Fast steghide cracker that can be used to extract hidden data from files
      firefox_decrypt # Decrypt user data from Firefox profile directory

      # Vulnerability Scanner
      nuclei # Fast and customizable vulnerability scanner based on simple YAML based DSL
      wapiti # Web application vulnerability scanner

      # Web
      arjun # HTTP parameter discovery suite
      feroxbuster # Fast, simple, recursive content discovery tool
      ffuf # Fast web fuzzer written in Go
      gobuster # Tool used to brute-force URIs, DNS subdomains, Virtual Host names on target web servers
      subfinder # Subdomain discovery tool
      wtfis # Passive hostname, domain and IP lookup tool for non-robots
      wfuzz # Web content fuzzer to facilitate web applications assessments
      whatweb # Next generation web scanner

      # SMB
      enum4linux-ng # Windows/Samba enumeration tool

      # Utility
      nmap-formatter # A tool that allows you to convert NMAP results to html, csv, json, markdown, graphviz (dot) or sqlite. Simply put it's nmap converter.
    ];
  };
}
