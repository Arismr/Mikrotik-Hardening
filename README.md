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
Step 1: Upload the Script to MikroTik

Method 1: Using Winbox
Open Winbox and connect to your MikroTik router.
Navigate to the Files section.

Drag & drop mikrotik-hardening.rsc into the router’s storage.

Method 2: Using SCP (Linux/macOS)
Open a terminal on your computer.
Run the following command to upload the script:

scp mikrotik-hardening.rsc admin@192.168.1.1:/flash/

Step 2: Run the Hardening Script

Once the script is uploaded, execute it via terminal:

/import mikrotik-hardening.rsc

The script will automatically apply security enhancements to the router.

Step 3: Verify Security Settings

To ensure that the script was applied correctly, check the following:
List disabled services:

/ip service print

Verify firewall rules:

/ip firewall filter print

Check logs for applied changes:

/log print

## Rollback Instructions

If needed, a rollback script (rollback.rsc) is available to undo the changes.
To Revert Changes:
Upload rollback.rsc using Winbox or SCP.
Execute the rollback script:

/import rollback.rsc

Verify that the original settings are restored.

## Important Notes

Backup Your Configuration: Always create a backup before applying security changes.

/export file=backup

Test in a Safe Environment: Apply the script on a test router before deploying it in production.
Customize as Needed: Modify the script to suit your network's security policies.

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
