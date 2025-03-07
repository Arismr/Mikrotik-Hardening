# MikroTik Router Security Hardening

This project provides a security hardening script for MikroTik RouterOS. The script implements best practices to secure your router by:

- Disabling insecure services
- Securing remote access (SSH on a non-default port)
- Enforcing robust firewall rules
- Managing user accounts securely
- Configuring system logging

## Features

- **Service Hardening:** Disables Telnet, FTP, and HTTP.
- **Access Control:** Limits SSH access to a trusted IP and changes the default port.
- **User Management:** Creates a secure admin account and optionally removes the default admin.
- **Firewall Rules:** Drops invalid packets and restricts management access to trusted sources.
- **Logging:** Sets up logging for monitoring firewall events.

## Prerequisites

- MikroTik RouterOS (ensure you have the latest version)
- Basic knowledge of MikroTik command line interface
- A trusted network configuration (replace `<trusted_ip>` in the script)

## Installation

1. Log in to your MikroTik router via Winbox or SSH.
2. Backup your current configuration.
3. Copy the contents of `SECURITY_HARDENING_SCRIPT.rsc` to your clipboard.
4. Paste and execute the script in the MikroTik terminal.
5. Verify the configuration changes and monitor logs for any issues.

## Usage

- **Security Enhancements:** The script will automatically disable unnecessary services and enforce secure configurations.
- **Monitoring:** Use the RouterOS logging feature to review any security-related events.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a clear description of your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Disclaimer

Ensure you test the script in a controlled environment before deploying it to production. Use at your own risk.
