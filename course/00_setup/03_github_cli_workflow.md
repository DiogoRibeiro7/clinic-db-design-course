# GitHub CLI workflow (Windows)

## Authenticate
```powershell
gh auth login
```
Follow the prompts and choose GitHub.com, HTTPS, and your preferred browser login.

## Clone the course repo
```powershell
gh repo clone <org_or_user>/clinic-db-design-course
cd clinic-db-design-course
```

## Create a branch for your submission
```powershell
git checkout -b week01-submission
```

## Commit and push
```powershell
git add .
git commit -m "week01: submission"
git push -u origin week01-submission
```

## Open a pull request
```powershell
gh pr create --title "Week 01 submission" --body "Submitting Week 01 work."
```
