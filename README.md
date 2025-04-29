# Zin ✨

As a developer grinding on my Linux machine, I live in the terminal. But let’s be real—committing, pushing to GitHub, and juggling remote repos can eat up time. Sometimes I even forget to link the remote repo! As a Laravel dev, I’m also drowning in `composer` and `php artisan` commands. That’s where **Zin** comes in—a slick little repo to handle my shortcuts and make life smoother. Let’s level up! 🚀

---

## 1. Installation 🔥

Get started in style:

```bash
cd ~  # Pop into your home directory like a boss
# Clone it with flair using GitHub CLI
gh repo clone nando-z/helper  
# Or go classic with SSH
git clone git@github.com:nando-z/helper.git
```
---
## 2. Add the Script to Your PATH 🎯
Supercharge your workflow by adding the script to your PATH. Pick your shell and roll:

Bash Vibes

```bash
echo "export PATH=$HOME/.script:$PATH" >> .bashrc
source .bashrc  # Reload and feel the power
```

Zsh Vibes

```zsh
echo 'export PATH=$HOME/.script:$PATH' >> .zshrc
source .zshrc  # Unleash the magic
```
Manual Mode 😎
No automation? No problem. Add .script/$PATH to your PATH manually like a pro.

# Note 
before any thing  install gh cli
- in ubuntu
  ```bash
  gh auth login
  ```
