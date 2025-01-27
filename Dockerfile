FROM hashicorp/vault:1.14

# Set environment variables
ENV VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200

# Expose the Vault port
EXPOSE 8200

# Start Vault in dev mode
CMD ["server", "-dev"]