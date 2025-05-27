# nyimbo_zetu

## This will serve as our official documentation.

# 🚀 Setting Up a GitHub Repository for Collaboration

This guide walks you through the process of creating and managing a GitHub repository for team collaboration.

---

## 1. Create a GitHub Repository

1. Go to [GitHub](https://github.com) and log in.
2. Click the **"+" icon** in the top-right corner → **New repository**.
3. Fill in the required fields:
   - **Repository name** (e.g., `my-project`)
   - Description (optional)
   - Choose **Public** or **Private**
4. (Optional)
   - Add a `README.md` file
   - Add a `.gitignore` based on your tech stack (e.g., Node, Python, Laravel)
   - Choose a license (e.g., MIT)
5. Click **Create repository**.

---

## 2. Clone the Repository Locally

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

> Replace `your-username` and `your-repo-name` with your actual GitHub details.

---

## 3. Set Up a New Branch

Create a branch to work on features or bug fixes:

```bash
git checkout -b feature/your-feature-name
```

---

## 4. Make Changes and Push Them

```bash
git add .
git commit -m "Add new feature or fix"
git push origin feature/your-feature-name
```

---

## 5. Create a Pull Request (PR)

1. Go to your GitHub repo in a browser.
2. You’ll see a prompt to **"Compare & pull request"** — click it.
3. Add a title and description.
4. Assign reviewers if needed.
5. Click **Create pull request**.

---

## 6. Review and Merge the PR

- Collaborators can review, comment, and approve the PR.
- Once approved, click **Merge pull request**.
- Optionally delete the branch after merging.

---

## 7. Add Collaborators to the Repo

1. Go to **Settings** of your repo.
2. Click **Collaborators and teams** under the **Access** section.
3. Click **Invite a collaborator**.
4. Enter their GitHub username or email.
5. Click **Add**.

---

## 8. Pull Changes Regularly

All team members should run:

```bash
git pull origin main
```

This ensures their local copy is in sync with the latest changes.

---

## ✅ Best Practices

- Use branches for each feature or fix.
- Write clear, meaningful commit messages.
- Keep `main` (or `master`) clean and deployable.
- Maintain a `README.md` and optionally a `CONTRIBUTING.md`.
- Use GitHub Issues or Projects for task tracking.

---

>Additional points

-- Test data

