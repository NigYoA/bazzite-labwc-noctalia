# Bazzite with LabWC + Noctalia

Custom bootc image based on Bazzite with LabWC tiling Wayland compositor and Noctalia tiling extension.

## What is this?

This image provides:
- **LabWC** — Stack-based Wayland compositor
- **Noctalia** — Tiling extension for LabWC
- **Ghostty** — GPU-accelerated terminal
- **Mako** — Notification daemon
- Plus standard Bazzite packages and utilities

## Installation

1. Fork this repository on GitHub
2. Clone your fork locally
3. Enable GitHub Actions workflows (Actions tab → "Set up actions" → "Set up workflow")
4. Generate a Cosign key:
   ```
   COSIGN_PASSWORD="" cosign generate-key-pair
   ```
5. Add `cosign.key` as `SIGNING_SECRET` in GitHub repo Settings → Secrets → Actions
6. Update `image-template.env`: set `REPO_ORGANIZATION` to your GitHub username
7. Commit and push

## Switch to this image

On a Bazzite machine:
```
sudo bootc switch ghcr.io/<your-username>/bazzite-labwc-noctalia
sudo systemctl reboot
```

After reboot, SDDM will offer LabWC session. Noctalia starts automatically.

## Updates

```
sudo bootc upgrade --reboot
sudo bootc rollback --reboot
```

## License

Apache-2.0