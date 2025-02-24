Here's a Bash script that will automatically update file and directory permissions to ensure [key-based SSH authentication](https://blog.radwebhosting.com/how-to-setup-ssh-login-with-public-key-authentication/) works properly. It adjusts permissions for:

- The SSH directory (`~/.ssh/`)
- The `authorized_keys` file
- The user's home directory (if necessary)

This script ensures that permissions are correctly set to prevent SSH from rejecting key-based authentication due to security concerns.

### **How to Use the Script**
1. Login to your server's shell console.
2. Run the following command:
   ```bash
   cd ~ && wget https://github.com/sclaeys/fix_ssh_permissions/blob/master/fix_ssh_permissions.sh && chmod +x fix_ssh_permissions.sh && ./fix_ssh_permissions.sh
   ```

### **What This Script Does**
- Ensures the **home directory** has `700` permissions.
- Ensures the **`~/.ssh/` directory** exists and is set to `700`.
- Ensures the **`authorized_keys` file** (if it exists) is set to `600`.
- Fixes the **SSH config file** permissions (if present).
- Sets the correct ownership for all files in `~/.ssh/`.

This setup ensures SSH authentication works properly while maintaining security best practices.

Additional Resources:
- [Bash Script to Automate Permissions Policy Requirements for Key-Based Authentication](https://radwebhosting.com/client_area/knowledgebase/517/Bash-Script-to-Automate-Permissions-Policy-Requirements-for-Key-Based-Authentication.html)
- 
