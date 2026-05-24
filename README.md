# Terraform Session Summary

## Installation

```bash
# Add HashiCorp GPG key
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
sudo apt update && sudo apt install terraform
```

> Reference: https://developer.hashicorp.com/terraform/install

---

## Commands Ran (in order)

| # | Command | What it does |
|---|---|---|
| 1 | `t plan` | Preview changes |
| 2 | `t apply` | Apply with manual `yes` |
| 3 | `ls` | List files |
| 4 | `cat automate.txt` | Read file content |
| 5 | `t --help` | Show help |
| 6 | `t destory` | ❌ Typo — failed |
| 7 | `t --help` | Checked help again |
| 8 | `t destroy` | ✅ Destroy with manual `yes` |
| 9 | `ls` | List files |
| 10 | `t apply` | Apply again |
| 11 | `ls` | List files |
| 12 | `cat automate.txt` | Read file again |
| 13 | `t apply --auto-approve` | Apply without prompt |
| 14 | `t apply --auto-approve` | Applied again |
| 15 | `t destroy --auto-approve` | Destroy without prompt |

---

## Mistakes Found

| Mistake | Fix |
|---|---|
| `t destory` |
| `t apply --auto-approve` |
| `t destroy --auto-approve` |

---

## Correct Commands (with aliases)

```bash
t plan                    # preview changes
t apply -auto-approve     # apply without prompt
t destroy -auto-approve   # destroy without prompt
cat automate.txt          # read file
```

---

## Key Takeaway

> Terraform flags use **single dash** `-auto-approve` not double dash `--auto-approve`

```bash
terraform apply -auto-approve

```