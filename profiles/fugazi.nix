{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      nmap-formatter # A tool that allows you to convert NMAP results to html, csv, json, markdown, graphviz (dot) or sqlite. Simply put it's nmap converter.
      subfinder # Subdomain discovery tool
      wtfis # Passive hostname, domain and IP lookup tool for non-robots
      rlwrap # Readline wrapper: adds readline support to tools that lack it
      rustcat # Netcat alternative written in Rust
      updog # Updog is a replacement for Python's SimpleHTTPServer. It allows uploading and downloading via HTTP/S, can set ad hoc SSL certificates and use http basic auth
      girsh # Automatically spawn a reverse shell fully interactive for Linux or Windows victim

      ## Vulnerability Scanner
      nuclei # Fast and customizable vulnerability scanner based on simple YAML based DSL

      ## Web
      arjun # HTTP parameter discovery suite
      feroxbuster # Fast, simple, recursive content discovery tool
      ffuf # Fast web fuzzer written in Go
      gobuster # Tool used to brute-force URIs, DNS subdomains, Virtual Host names on target web servers
      wfuzz # Web content fuzzer to facilitate web applications assessments
      whatweb # Next generation web scanner
    ];
  };
}
